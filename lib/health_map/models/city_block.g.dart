// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityBlock _$CityBlockFromJson(Map<String, dynamic> json) => _CityBlock(
  id: json['id'] as String,
  name: json['name'] as String,
  zone: json['zone'] as String,
  gridRow: (json['gridRow'] as num).toInt(),
  gridCol: (json['gridCol'] as num).toInt(),
  houseRows: (json['houseRows'] as num).toInt(),
  houseCols: (json['houseCols'] as num).toInt(),
);

Map<String, dynamic> _$CityBlockToJson(_CityBlock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'zone': instance.zone,
      'gridRow': instance.gridRow,
      'gridCol': instance.gridCol,
      'houseRows': instance.houseRows,
      'houseCols': instance.houseCols,
    };
