import 'package:freezed_annotation/freezed_annotation.dart';

import 'health_status.dart';

part 'house.freezed.dart';
part 'house.g.dart';

/// A house inside a [CityBlock]. [row]/[col] locate it on the block's
/// house grid and drive both rendering and cluster adjacency.
///
/// Stored at `blocks/{blockId}/houses/{id}`.
@freezed
abstract class House with _$House {
  const House._();

  const factory House({
    required String id,
    required String blockId,
    required String label,
    required int row,
    required int col,
    @Default(1) int occupants,
    @Default(HealthStatus.healthy()) HealthStatus status,
    DateTime? updatedAt,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

  bool get isInfected => status.isInfected;
}
