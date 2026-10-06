import 'package:city_health_tracker/health_map/blocs/city_health_cubit.dart';
import 'package:city_health_tracker/health_map/models/models.dart';
import 'package:city_health_tracker/health_map/service/city_health_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers.dart';

class _MockService extends Mock implements CityHealthService {}

void main() {
  late CityHealthCubit cubit;

  setUp(() => cubit = CityHealthCubit(_MockService()));
  tearDown(() => cubit.close());

  group('detectClusters', () {
    test('groups orthogonally adjacent infected houses', () {
      final clusters = cubit.detectClusters(
        blockFromGrid('A1', ['xx..', '.x..', '....']),
      );
      expect(clusters, hasLength(1));
      expect(clusters.single.houseIds, ['A1-r0c0', 'A1-r0c1', 'A1-r1c1']);
    });

    test('treats diagonal neighbours as connected', () {
      final clusters = cubit.detectClusters(
        blockFromGrid('A1', ['x...', '.x..', '..x.']),
      );
      expect(clusters.single.size, 3);
    });

    test('ignores groups smaller than minClusterSize', () {
      final clusters = cubit.detectClusters(
        blockFromGrid('A1', ['xx..', '....', '..x.']),
      );
      expect(clusters, isEmpty);
    });

    test('respects a custom minClusterSize', () async {
      final pairs = CityHealthCubit(_MockService(), minClusterSize: 2);
      addTearDown(pairs.close);
      expect(pairs.detectClusters(blockFromGrid('A1', ['xx..'])), hasLength(1));
    });

    test('suspected/recovered houses do not bridge clusters', () {
      final clusters = cubit.detectClusters(
        blockFromGrid('A1', ['xxsxx', 'x.r.x']),
      );
      expect(clusters.map((c) => c.size), [3, 3]);
    });

    test(
      'returns separate clusters largest-first with bounds and severity',
      () {
        final clusters = cubit.detectClusters(
          blockFromGrid('B2', ['xm...', 'x...x', '...xS', '...xx']),
        );
        expect(clusters.map((c) => c.size), [5, 3]);

        final big = clusters.first;
        expect((big.minRow, big.maxRow, big.minCol, big.maxCol), (1, 3, 3, 4));
        expect(big.peakSeverity, InfectionSeverity.severe);

        final small = clusters.last;
        expect(
          (small.minRow, small.maxRow, small.minCol, small.maxCol),
          (0, 1, 0, 1),
        );
        expect(small.peakSeverity, InfectionSeverity.moderate);
      },
    );

    test('cluster ids are stable for the same input', () {
      List<String> ids() =>
          cubit
              .detectClusters(blockFromGrid('C3', ['xxx.xxx']))
              .map((c) => c.id)
              .toList()
            ..sort();
      expect(ids(), ['C3-C1', 'C3-C2']);
      expect(ids(), ids());
    });
  });

  group('assessRisk', () {
    RiskLevel risk(List<String> grid) {
      final block = blockFromGrid('A1', grid);
      return cubit.assessRisk(
        cubit.countStatuses(block.houses),
        cubit.detectClusters(block),
      );
    }

    test('low when nothing notable', () {
      expect(risk(['....', '...r', '....', '....', 's...']), RiskLevel.low);
    });
    test('moderate for an isolated infection', () {
      expect(
        risk(['x...', '....', '....', '....', '....']),
        RiskLevel.moderate,
      );
    });
    test('moderate for several suspected houses', () {
      expect(
        risk(['s..s', '....', '....', '....', '....']),
        RiskLevel.moderate,
      );
    });
    test('high when a cluster exists', () {
      expect(
        risk(['xx..', 'x...', '....', '....', '....', '....', '....']),
        RiskLevel.high,
      );
    });
    test('critical for a large cluster', () {
      expect(
        risk(['xxx...', 'xx....', '......', '......', '......', '......']),
        RiskLevel.critical,
      );
    });
    test('critical for a high infection rate without clusters', () {
      expect(risk(['x.x', '...', 'x.x']), RiskLevel.critical);
    });
  });

  group('buildSnapshot', () {
    test('sorts blocks/houses, sizes the grid and aggregates stats', () {
      final snapshot = cubit.buildSnapshot([
        blockFromGrid('B2', ['xx', 'x.'], gridRow: 1, gridCol: 1),
        blockFromGrid('A1', ['..', 's.'], gridRow: 0, gridCol: 0),
        blockFromGrid('A2', ['x.', '.r'], gridRow: 0, gridCol: 1).copyWith(
          houses: blockFromGrid('A2', ['x.', '.r']).houses.reversed.toList(),
        ),
      ]);

      expect(snapshot.blocks.map((b) => b.id), ['A1', 'A2', 'B2']);
      expect(snapshot.blockById('A2')!.houses.map((h) => (h.row, h.col)), [
        (0, 0),
        (0, 1),
        (1, 0),
        (1, 1),
      ]);
      expect((snapshot.gridRows, snapshot.gridCols), (2, 2));

      final stats = snapshot.stats;
      expect(stats.totalBlocks, 3);
      expect(
        stats.counts,
        const HealthCounts(healthy: 6, suspected: 1, infected: 4, recovered: 1),
      );
      expect(stats.totalClusters, 1);
      expect(stats.largestClusterSize, 3);
      expect(stats.hotspotBlockIds, ['B2', 'A2']);
      // B2: 75% infected -> critical. A2: 25% -> high. A1: 1 suspected -> low.
      expect(stats.blocksByRisk, {
        RiskLevel.low: 1,
        RiskLevel.moderate: 0,
        RiskLevel.high: 1,
        RiskLevel.critical: 1,
      });
      expect(stats.lastUpdated, DateTime.utc(2026, 10, 1, 0, 11));

      final b2 = snapshot.summaryOf('B2')!;
      expect(b2.clusterIdOf('B2-r0c0'), 'B2-C1');
      expect(b2.clusterIdOf('B2-r1c1'), isNull);
    });
  });
}
