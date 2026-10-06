import 'package:freezed_annotation/freezed_annotation.dart';

import 'health_status.dart';

part 'infection_cluster.freezed.dart';

/// A group of infected houses that touch each other (including diagonally)
/// within one block. Derived by the cubit, never persisted.
///
/// The row/col bounds let the UI draw a single outline around the group.
@freezed
abstract class InfectionCluster with _$InfectionCluster {
  const InfectionCluster._();

  const factory InfectionCluster({
    required String id,
    required String blockId,
    required List<String> houseIds,
    required int minRow,
    required int maxRow,
    required int minCol,
    required int maxCol,
    required InfectionSeverity peakSeverity,
  }) = _InfectionCluster;

  int get size => houseIds.length;
}
