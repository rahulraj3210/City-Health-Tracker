// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_House _$HouseFromJson(Map<String, dynamic> json) => _House(
  id: json['id'] as String,
  blockId: json['blockId'] as String,
  label: json['label'] as String,
  row: (json['row'] as num).toInt(),
  col: (json['col'] as num).toInt(),
  occupants: (json['occupants'] as num?)?.toInt() ?? 1,
  status: json['status'] == null
      ? const HealthStatus.healthy()
      : HealthStatus.fromJson(json['status'] as Map<String, dynamic>),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$HouseToJson(_House instance) => <String, dynamic>{
  'id': instance.id,
  'blockId': instance.blockId,
  'label': instance.label,
  'row': instance.row,
  'col': instance.col,
  'occupants': instance.occupants,
  'status': instance.status.toJson(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
