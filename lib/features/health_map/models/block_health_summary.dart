import 'package:freezed_annotation/freezed_annotation.dart';

import 'infection_cluster.dart';

part 'block_health_summary.freezed.dart';

enum RiskLevel { low, moderate, high, critical }

/// Number of houses in each health state.
@freezed
abstract class HealthCounts with _$HealthCounts {
  const HealthCounts._();

  const factory HealthCounts({
    @Default(0) int healthy,
    @Default(0) int suspected,
    @Default(0) int infected,
    @Default(0) int recovered,
  }) = _HealthCounts;

  int get total => healthy + suspected + infected + recovered;

  double get infectionRate => total == 0 ? 0 : infected / total;
}

/// Derived health picture of one block, computed by the cubit.
@freezed
abstract class BlockHealthSummary with _$BlockHealthSummary {
  const BlockHealthSummary._();

  const factory BlockHealthSummary({
    required String blockId,
    required HealthCounts counts,
    required List<InfectionCluster> clusters,
    required RiskLevel riskLevel,

    /// houseId -> clusterId, for O(1) lookups while rendering houses.
    required Map<String, String> houseClusterIndex,
  }) = _BlockHealthSummary;

  bool get hasClusters => clusters.isNotEmpty;

  String? clusterIdOf(String houseId) => houseClusterIndex[houseId];
}
