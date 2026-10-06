import 'package:freezed_annotation/freezed_annotation.dart';

import 'house.dart';

part 'city_block.freezed.dart';
part 'city_block.g.dart';

/// A city block positioned at [gridRow]/[gridCol] on the city grid, holding a
/// [houseRows] x [houseCols] grid of houses.
///
/// Stored at `blocks/{id}`; [houses] live in the `houses` subcollection and
/// are attached by the service, so they are excluded from JSON.
@freezed
abstract class CityBlock with _$CityBlock {
  const factory CityBlock({
    required String id,
    required String name,
    required String zone,
    required int gridRow,
    required int gridCol,
    required int houseRows,
    required int houseCols,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<House>[])
    List<House> houses,
  }) = _CityBlock;

  factory CityBlock.fromJson(Map<String, dynamic> json) =>
      _$CityBlockFromJson(json);
}
