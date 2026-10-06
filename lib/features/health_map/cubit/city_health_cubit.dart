import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/models.dart';
import '../services/city_health_service.dart';

part 'city_health_cubit.freezed.dart';
part 'city_health_state.dart';

/// Mediates between [CityHealthService] and the UI: subscribes to live city
/// data, detects infection clusters, scores block risk and aggregates
/// city-wide stats into a [CityHealthSnapshot].
class CityHealthCubit extends Cubit<CityHealthState> {
  CityHealthCubit(this._service, {this.minClusterSize = 3})
    : assert(minClusterSize >= 2, 'A cluster needs at least two houses'),
      super(const CityHealthState.initial());

  final CityHealthService _service;

  /// Minimum number of touching infected houses that counts as a cluster.
  final int minClusterSize;

  /// Thresholds used by [assessRisk].
  static const criticalClusterSize = 5;
  static const criticalInfectionRate = 0.30;
  static const highInfectionRate = 0.15;
  static const moderateSuspectedCount = 2;

  StreamSubscription<List<CityBlock>>? _subscription;

  /// Starts (or restarts, e.g. on retry) the live city subscription.
  void watchCity() {
    _subscription?.cancel();
    emit(const CityHealthState.loading());
    _subscription = _service.watchCity().listen(
      (blocks) => emit(CityHealthState.loaded(buildSnapshot(blocks))),
      onError: (Object error, StackTrace stackTrace) {
        addError(error, stackTrace);
        emit(
          CityHealthState.failure(
            error is CityHealthServiceException
                ? error.message
                : 'Something went wrong while loading city health data.',
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }

  // ---------------------------------------------------------------------------
  // Pure logic below — public so it can be unit-tested without streams.
  // ---------------------------------------------------------------------------

  CityHealthSnapshot buildSnapshot(List<CityBlock> rawBlocks) {
    final blocks =
        [
          for (final block in rawBlocks)
            block.copyWith(
              houses: [
                ...block.houses,
              ]..sort((a, b) => a.row != b.row ? a.row - b.row : a.col - b.col),
            ),
        ]..sort(
          (a, b) => a.gridRow != b.gridRow
              ? a.gridRow - b.gridRow
              : a.gridCol - b.gridCol,
        );

    final summaries = {
      for (final block in blocks) block.id: summarizeBlock(block),
    };

    var gridRows = 0;
    var gridCols = 0;
    for (final block in blocks) {
      gridRows = max(gridRows, block.gridRow + 1);
      gridCols = max(gridCols, block.gridCol + 1);
    }

    return CityHealthSnapshot(
      blocks: blocks,
      summaries: summaries,
      stats: aggregateStats(blocks, summaries),
      gridRows: gridRows,
      gridCols: gridCols,
    );
  }

  BlockHealthSummary summarizeBlock(CityBlock block) {
    final counts = countStatuses(block.houses);
    final clusters = detectClusters(block);
    return BlockHealthSummary(
      blockId: block.id,
      counts: counts,
      clusters: clusters,
      riskLevel: assessRisk(counts, clusters),
      houseClusterIndex: {
        for (final cluster in clusters)
          for (final houseId in cluster.houseIds) houseId: cluster.id,
      },
    );
  }

  HealthCounts countStatuses(Iterable<House> houses) {
    var healthy = 0, suspected = 0, infected = 0, recovered = 0;
    for (final house in houses) {
      switch (house.status) {
        case HealthyStatus():
          healthy++;
        case SuspectedStatus():
          suspected++;
        case InfectedStatus():
          infected++;
        case RecoveredStatus():
          recovered++;
      }
    }
    return HealthCounts(
      healthy: healthy,
      suspected: suspected,
      infected: infected,
      recovered: recovered,
    );
  }

  /// Groups infected houses that touch horizontally, vertically or diagonally
  /// (8-connectivity) into clusters of at least [minClusterSize] houses.
  /// Returned largest first; ids are stable for the same input.
  List<InfectionCluster> detectClusters(CityBlock block) {
    final infectedByCell = <(int, int), House>{
      for (final house in block.houses)
        if (house.isInfected) (house.row, house.col): house,
    };

    final visited = <(int, int)>{};
    final components = <List<House>>[];

    // Iterate in grid order so cluster numbering is deterministic.
    final cells = infectedByCell.keys.toList()
      ..sort((a, b) => a.$1 != b.$1 ? a.$1 - b.$1 : a.$2 - b.$2);

    for (final start in cells) {
      if (!visited.add(start)) continue;
      final component = <House>[];
      final queue = [start];
      while (queue.isNotEmpty) {
        final cell = queue.removeLast();
        component.add(infectedByCell[cell]!);
        for (var dr = -1; dr <= 1; dr++) {
          for (var dc = -1; dc <= 1; dc++) {
            if (dr == 0 && dc == 0) continue;
            final next = (cell.$1 + dr, cell.$2 + dc);
            if (infectedByCell.containsKey(next) && visited.add(next)) {
              queue.add(next);
            }
          }
        }
      }
      if (component.length >= minClusterSize) components.add(component);
    }

    final clusters = <InfectionCluster>[
      for (final (index, houses) in components.indexed)
        InfectionCluster(
          id: '${block.id}-C${index + 1}',
          blockId: block.id,
          houseIds: [for (final h in houses) h.id]..sort(),
          minRow: houses.map((h) => h.row).reduce(min),
          maxRow: houses.map((h) => h.row).reduce(max),
          minCol: houses.map((h) => h.col).reduce(min),
          maxCol: houses.map((h) => h.col).reduce(max),
          peakSeverity: houses
              .map((h) => (h.status as InfectedStatus).severity)
              .reduce((a, b) => a.index >= b.index ? a : b),
        ),
    ];
    return clusters..sort((a, b) => b.size - a.size);
  }

  RiskLevel assessRisk(HealthCounts counts, List<InfectionCluster> clusters) {
    final largest = clusters.fold(0, (m, c) => max(m, c.size));
    final rate = counts.infectionRate;
    if (largest >= criticalClusterSize || rate >= criticalInfectionRate) {
      return RiskLevel.critical;
    }
    if (clusters.isNotEmpty || rate >= highInfectionRate) return RiskLevel.high;
    if (counts.infected > 0 || counts.suspected >= moderateSuspectedCount) {
      return RiskLevel.moderate;
    }
    return RiskLevel.low;
  }

  CityHealthStats aggregateStats(
    List<CityBlock> blocks,
    Map<String, BlockHealthSummary> summaries,
  ) {
    var healthy = 0, suspected = 0, infected = 0, recovered = 0;
    var totalClusters = 0, largestCluster = 0;
    final blocksByRisk = {for (final level in RiskLevel.values) level: 0};
    DateTime? lastUpdated;

    for (final summary in summaries.values) {
      healthy += summary.counts.healthy;
      suspected += summary.counts.suspected;
      infected += summary.counts.infected;
      recovered += summary.counts.recovered;
      totalClusters += summary.clusters.length;
      for (final cluster in summary.clusters) {
        largestCluster = max(largestCluster, cluster.size);
      }
      blocksByRisk[summary.riskLevel] = blocksByRisk[summary.riskLevel]! + 1;
    }
    for (final block in blocks) {
      for (final house in block.houses) {
        final updated = house.updatedAt;
        if (updated != null &&
            (lastUpdated == null || updated.isAfter(lastUpdated))) {
          lastUpdated = updated;
        }
      }
    }

    final hotspots =
        summaries.values
            .where((s) => s.riskLevel.index >= RiskLevel.high.index)
            .toList()
          ..sort((a, b) {
            final byRisk = b.riskLevel.index - a.riskLevel.index;
            if (byRisk != 0) return byRisk;
            final byInfected = b.counts.infected - a.counts.infected;
            return byInfected != 0
                ? byInfected
                : a.blockId.compareTo(b.blockId);
          });

    return CityHealthStats(
      totalBlocks: blocks.length,
      counts: HealthCounts(
        healthy: healthy,
        suspected: suspected,
        infected: infected,
        recovered: recovered,
      ),
      totalClusters: totalClusters,
      largestClusterSize: largestCluster,
      blocksByRisk: blocksByRisk,
      hotspotBlockIds: [for (final s in hotspots) s.blockId],
      lastUpdated: lastUpdated,
    );
  }
}
