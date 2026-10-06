import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:city_health_tracker/features/health_map/cubit/city_health_cubit.dart';
import 'package:city_health_tracker/features/health_map/services/city_health_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers.dart';

class _MockService extends Mock implements CityHealthService {}

void main() {
  late _MockService service;
  late StreamController<List<dynamic>> controller;

  setUp(() {
    service = _MockService();
    controller = StreamController.broadcast();
  });
  tearDown(() => controller.close());

  final city = [
    blockFromGrid('A1', ['xx', 'x.']),
  ];

  blocTest<CityHealthCubit, CityHealthState>(
    'emits loading then loaded with derived clusters on each update',
    setUp: () =>
        when(() => service.watchCity())
            .thenAnswer((_) => Stream.fromIterable([city, <Never>[]])),
    build: () => CityHealthCubit(service),
    act: (cubit) => cubit.watchCity(),
    expect: () => [
      const CityHealthState.loading(),
      isA<CityHealthLoaded>().having(
        (s) => s.snapshot.summaryOf('A1')!.clusters.single.size,
        'A1 cluster size',
        3,
      ),
      isA<CityHealthLoaded>().having(
        (s) => s.snapshot.blocks,
        'blocks',
        isEmpty,
      ),
    ],
  );

  blocTest<CityHealthCubit, CityHealthState>(
    'surfaces service exception messages as failure',
    setUp: () => when(() => service.watchCity()).thenAnswer(
      (_) => Stream.error(const CityHealthServiceException('No permission')),
    ),
    build: () => CityHealthCubit(service),
    act: (cubit) => cubit.watchCity(),
    expect: () => [
      const CityHealthState.loading(),
      const CityHealthState.failure('No permission'),
    ],
    errors: () => [isA<CityHealthServiceException>()],
  );

  blocTest<CityHealthCubit, CityHealthState>(
    'uses a generic message for unexpected errors',
    setUp: () =>
        when(() => service.watchCity())
            .thenAnswer((_) => Stream.error(StateError('boom'))),
    build: () => CityHealthCubit(service),
    act: (cubit) => cubit.watchCity(),
    expect: () => [const CityHealthState.loading(), isA<CityHealthFailure>()],
    errors: () => [isA<StateError>()],
  );

  test('watchCity again (retry) resubscribes and close cancels', () async {
    var listens = 0;
    var cancels = 0;
    when(() => service.watchCity()).thenAnswer((_) {
      final c = StreamController<Never>(
        onListen: () => listens++,
        onCancel: () => cancels++,
      );
      return c.stream;
    });

    final cubit = CityHealthCubit(service)..watchCity();
    await Future<void>.delayed(Duration.zero);
    cubit.watchCity();
    await Future<void>.delayed(Duration.zero);
    expect((listens, cancels), (2, 1));

    await cubit.close();
    expect(cancels, 2);
  });
}
