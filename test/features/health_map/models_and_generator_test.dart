import 'package:city_health_tracker/features/health_map/cubit/city_health_cubit.dart';
import 'package:city_health_tracker/features/health_map/models/models.dart';
import 'package:city_health_tracker/features/health_map/services/city_health_service.dart';
import 'package:city_health_tracker/features/health_map/services/mock_city_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockService extends Mock implements CityHealthService {}

void main() {
  group('HealthStatus JSON', () {
    final t = DateTime.utc(2026, 10, 1);
    for (final status in [
      const HealthStatus.healthy(),
      HealthStatus.suspected(reportedAt: t),
      HealthStatus.infected(confirmedAt: t, severity: InfectionSeverity.severe),
      HealthStatus.recovered(recoveredAt: t),
    ]) {
      test('round-trips ${status.runtimeType}', () {
        final house = House(
          id: 'h',
          blockId: 'b',
          label: 'L',
          row: 1,
          col: 2,
          status: status,
        );
        expect(House.fromJson(house.toJson()), house);
      });
    }

    test('uses a "type" discriminator', () {
      expect(
        HealthStatus.infected(confirmedAt: t).toJson()['type'],
        'infected',
      );
    });

    test('CityBlock JSON excludes houses', () {
      final block = MockCityGenerator().generate().first;
      expect(block.toJson().containsKey('houses'), isFalse);
      expect(CityBlock.fromJson(block.toJson()), block.copyWith(houses: []));
    });
  });

  group('MockCityGenerator', () {
    test('is deterministic for a seed', () {
      expect(
        MockCityGenerator(seed: 7).generate(),
        MockCityGenerator(seed: 7).generate(),
      );
      expect(
        MockCityGenerator(seed: 7).generate(),
        isNot(MockCityGenerator(seed: 8).generate()),
      );
    });

    test(
      'produces a full grid with consistent houses and real clusters',
      () async {
        final blocks = MockCityGenerator().generate();
        expect(blocks, hasLength(36));
        for (final b in blocks) {
          expect(b.houses, hasLength(b.houseRows * b.houseCols));
          expect(b.houses.every((h) => h.blockId == b.id), isTrue);
          expect(b.houses.map((h) => h.id).toSet(), hasLength(b.houses.length));
        }

        final cubit = CityHealthCubit(_MockService());
        addTearDown(cubit.close);
        final stats = cubit.buildSnapshot(blocks).stats;
        expect(stats.totalClusters, greaterThanOrEqualTo(3));
        expect(stats.counts.healthy, greaterThan(stats.counts.infected));
      },
    );

    test('every outbreak forms one distinct cluster of 4-8 houses', () {
      final cubit = CityHealthCubit(_MockService());
      addTearDown(cubit.close);
      for (var seed = 1; seed <= 30; seed++) {
        final snapshot = cubit.buildSnapshot(
          MockCityGenerator(seed: seed).generate(),
        );
        final sizes = [
          for (final s in snapshot.summaries.values)
            for (final c in s.clusters) c.size,
        ];
        final outbreakSized = sizes.where((n) => n >= 4 && n <= 8);
        expect(
          outbreakSized.length,
          greaterThanOrEqualTo(6),
          reason: 'seed $seed',
        );
        expect(
          sizes.every((n) => n <= 8),
          isTrue,
          reason: 'seed $seed: $sizes',
        );
      }
    });
  });
}
