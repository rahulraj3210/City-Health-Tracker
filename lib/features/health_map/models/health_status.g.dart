// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthyStatus _$HealthyStatusFromJson(Map<String, dynamic> json) =>
    HealthyStatus($type: json['type'] as String?);

Map<String, dynamic> _$HealthyStatusToJson(HealthyStatus instance) =>
    <String, dynamic>{'type': instance.$type};

SuspectedStatus _$SuspectedStatusFromJson(Map<String, dynamic> json) =>
    SuspectedStatus(
      reportedAt: DateTime.parse(json['reportedAt'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SuspectedStatusToJson(SuspectedStatus instance) =>
    <String, dynamic>{
      'reportedAt': instance.reportedAt.toIso8601String(),
      'type': instance.$type,
    };

InfectedStatus _$InfectedStatusFromJson(Map<String, dynamic> json) =>
    InfectedStatus(
      confirmedAt: DateTime.parse(json['confirmedAt'] as String),
      severity:
          $enumDecodeNullable(_$InfectionSeverityEnumMap, json['severity']) ??
          InfectionSeverity.mild,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$InfectedStatusToJson(InfectedStatus instance) =>
    <String, dynamic>{
      'confirmedAt': instance.confirmedAt.toIso8601String(),
      'severity': _$InfectionSeverityEnumMap[instance.severity]!,
      'type': instance.$type,
    };

const _$InfectionSeverityEnumMap = {
  InfectionSeverity.mild: 'mild',
  InfectionSeverity.moderate: 'moderate',
  InfectionSeverity.severe: 'severe',
};

RecoveredStatus _$RecoveredStatusFromJson(Map<String, dynamic> json) =>
    RecoveredStatus(
      recoveredAt: DateTime.parse(json['recoveredAt'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$RecoveredStatusToJson(RecoveredStatus instance) =>
    <String, dynamic>{
      'recoveredAt': instance.recoveredAt.toIso8601String(),
      'type': instance.$type,
    };
