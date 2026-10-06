import 'package:bloc_test/bloc_test.dart';
import 'package:city_health_tracker/features/health_map/cubit/house_status_cubit.dart';
import 'package:city_health_tracker/features/health_map/models/models.dart';
import 'package:city_health_tracker/features/health_map/services/city_health_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockService extends Mock implements CityHealthService {}

void main() {
  final now = DateTime.utc(2026, 10, 6, 12);
  final earlier = DateTime.utc(2026, 9, 1);
  late _MockService service;

  House house(HealthStatus status) => House(
    id: 'A1-H01',
    blockId: 'A1',
    label: 'A1-01',
    row: 0,
    col: 0,
    status: status,
  );

  HouseStatusCubit build() => HouseStatusCubit(service, clock: () => now);

  void stubUpdate([Future<void> Function()? answer]) => when(
    () => service.updateHouseStatus(
      blockId: any(named: 'blockId'),
      houseId: any(named: 'houseId'),
      status: any(named: 'status'),
    ),
  ).thenAnswer((_) => answer?.call() ?? Future.value());

  setUpAll(() => registerFallbackValue(const HealthStatus.healthy()));
  setUp(() => service = _MockService());

  group('buildStatus', () {
    late HouseStatusCubit cubit;
    setUp(() => cubit = build());
    tearDown(() => cubit.close());

    test('dates a new state with the clock (UTC)', () {
      expect(
        cubit.buildStatus(
          const HealthStatus.healthy(),
          HealthStatusKind.infected,
          severity: InfectionSeverity.severe,
        ),
        HealthStatus.infected(
          confirmedAt: now,
          severity: InfectionSeverity.severe,
        ),
      );
      expect(
        cubit.buildStatus(
          const HealthStatus.healthy(),
          HealthStatusKind.suspected,
        ),
        HealthStatus.suspected(reportedAt: now),
      );
      expect(
        cubit.buildStatus(
          HealthStatus.infected(confirmedAt: earlier),
          HealthStatusKind.recovered,
        ),
        HealthStatus.recovered(recoveredAt: now),
      );
    });

    test('changing only severity keeps the original confirmation date', () {
      expect(
        cubit.buildStatus(
          HealthStatus.infected(confirmedAt: earlier),
          HealthStatusKind.infected,
          severity: InfectionSeverity.moderate,
        ),
        HealthStatus.infected(
          confirmedAt: earlier,
          severity: InfectionSeverity.moderate,
        ),
      );
    });

    test('re-selecting the same kind is not a change', () {
      final suspected = house(HealthStatus.suspected(reportedAt: earlier));
      expect(cubit.isChange(suspected, HealthStatusKind.suspected), isFalse);
      expect(cubit.isChange(suspected, HealthStatusKind.healthy), isTrue);

      final infected = house(
        HealthStatus.infected(
          confirmedAt: earlier,
          severity: InfectionSeverity.moderate,
        ),
      );
      expect(
        cubit.isChange(
          infected,
          HealthStatusKind.infected,
          severity: InfectionSeverity.moderate,
        ),
        isFalse,
      );
      expect(
        cubit.isChange(
          infected,
          HealthStatusKind.infected,
          severity: InfectionSeverity.severe,
        ),
        isTrue,
      );
    });
  });

  group('changeStatus', () {
    final target = HealthStatus.recovered(recoveredAt: now);

    blocTest<HouseStatusCubit, HouseStatusState>(
      'writes through the service and reports success',
      setUp: stubUpdate,
      build: build,
      act: (c) => c.changeStatus(
        house(HealthStatus.infected(confirmedAt: earlier)),
        HealthStatusKind.recovered,
      ),
      expect: () => [
        HouseStatusState.saving(houseId: 'A1-H01', status: target),
        HouseStatusState.success(houseId: 'A1-H01', status: target),
      ],
      verify: (_) => verify(
        () => service.updateHouseStatus(
          blockId: 'A1',
          houseId: 'A1-H01',
          status: target,
        ),
      ).called(1),
    );

    blocTest<HouseStatusCubit, HouseStatusState>(
      'surfaces the service error message',
      setUp: () => stubUpdate(
        () => Future.error(
          const CityHealthServiceException('The server rejected this change.'),
        ),
      ),
      build: build,
      act: (c) => c.changeStatus(
        house(const HealthStatus.healthy()),
        HealthStatusKind.recovered,
      ),
      expect: () => [
        isA<HouseStatusSaving>(),
        const HouseStatusState.failure(
          houseId: 'A1-H01',
          message: 'The server rejected this change.',
        ),
      ],
      errors: () => [isA<CityHealthServiceException>()],
    );

    blocTest<HouseStatusCubit, HouseStatusState>(
      'uses a generic message for unexpected errors',
      setUp: () => stubUpdate(() => Future.error(StateError('boom'))),
      build: build,
      act: (c) => c.changeStatus(
        house(const HealthStatus.healthy()),
        HealthStatusKind.recovered,
      ),
      expect: () => [
        isA<HouseStatusSaving>(),
        const HouseStatusState.failure(
          houseId: 'A1-H01',
          message: 'Could not save the change.',
        ),
      ],
      errors: () => [isA<StateError>()],
    );

    blocTest<HouseStatusCubit, HouseStatusState>(
      'does nothing when the status would not change',
      build: build,
      act: (c) => c.changeStatus(
        house(const HealthStatus.healthy()),
        HealthStatusKind.healthy,
      ),
      expect: () => const <HouseStatusState>[],
      verify: (_) => verifyNever(
        () => service.updateHouseStatus(
          blockId: any(named: 'blockId'),
          houseId: any(named: 'houseId'),
          status: any(named: 'status'),
        ),
      ),
    );

    blocTest<HouseStatusCubit, HouseStatusState>(
      'ignores a second save while one is in flight',
      setUp: () =>
          stubUpdate(() => Future.delayed(const Duration(milliseconds: 10))),
      build: build,
      act: (c) async {
        final h = house(const HealthStatus.healthy());
        await Future.wait([
          c.changeStatus(h, HealthStatusKind.recovered),
          c.changeStatus(h, HealthStatusKind.suspected),
        ]);
      },
      expect: () => [isA<HouseStatusSaving>(), isA<HouseStatusSuccess>()],
      verify: (_) => verify(
        () => service.updateHouseStatus(
          blockId: any(named: 'blockId'),
          houseId: any(named: 'houseId'),
          status: any(named: 'status'),
        ),
      ).called(1),
    );

    blocTest<HouseStatusCubit, HouseStatusState>(
      'reset clears a finished save',
      build: build,
      seed: () => HouseStatusState.success(houseId: 'A1-H01', status: target),
      act: (c) => c.reset(),
      expect: () => const [HouseStatusState.idle()],
    );
  });
}
