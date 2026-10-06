import 'package:freezed_annotation/freezed_annotation.dart';

import 'block_health_summary.dart';
import 'city_block.dart';

part 'city_health_snapshot.freezed.dart';

/// City-wide aggregates shown on the dashboard.
@freezed
abstract class CityHealthStats with _$CityHealthStats {
  const factory CityHealthStats({
    required int totalBlocks,
    required HealthCounts counts,
    required int totalClusters,
    required int largestClusterSize,
    required Map<RiskLevel, int> blocksByRisk,

    /// High/critical blocks, most at-risk first.
    required List<String> hotspotBlockIds,
    DateTime? lastUpdated,
  }) = _CityHealthStats;
}

/// Everything the UI needs for one render of the city: blocks (sorted by grid
/// position, houses sorted by row/col), per-block summaries, and city stats.
@freezed
abstract class CityHealthSnapshot with _$CityHealthSnapshot {
  const CityHealthSnapshot._();

  const factory CityHealthSnapshot({
    required List<CityBlock> blocks,
    required Map<String, BlockHealthSummary> summaries,
    required CityHealthStats stats,
    required int gridRows,
    required int gridCols,
  }) = _CityHealthSnapshot;

  CityBlock? blockById(String id) {
    for (final block in blocks) {
      if (block.id == id) return block;
    }
    return null;
  }

  BlockHealthSummary? summaryOf(String blockId) => summaries[blockId];
}
