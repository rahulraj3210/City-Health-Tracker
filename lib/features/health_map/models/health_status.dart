import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_status.freezed.dart';
part 'health_status.g.dart';

enum InfectionSeverity { mild, moderate, severe }

/// The four health states without their payloads; handy for pickers,
/// legends and counts.
enum HealthStatusKind { healthy, suspected, infected, recovered }

/// Health state of a single house. Serialised with a `type` discriminator,
/// e.g. `{"type": "infected", "confirmedAt": ..., "severity": "severe"}`.
@Freezed(unionKey: 'type')
sealed class HealthStatus with _$HealthStatus {
  const HealthStatus._();

  const factory HealthStatus.healthy() = HealthyStatus;

  const factory HealthStatus.suspected({required DateTime reportedAt}) =
      SuspectedStatus;

  const factory HealthStatus.infected({
    required DateTime confirmedAt,
    @Default(InfectionSeverity.mild) InfectionSeverity severity,
  }) = InfectedStatus;

  const factory HealthStatus.recovered({required DateTime recoveredAt}) =
      RecoveredStatus;

  factory HealthStatus.fromJson(Map<String, dynamic> json) =>
      _$HealthStatusFromJson(json);

  bool get isInfected => this is InfectedStatus;

  HealthStatusKind get kind => switch (this) {
    HealthyStatus() => HealthStatusKind.healthy,
    SuspectedStatus() => HealthStatusKind.suspected,
    InfectedStatus() => HealthStatusKind.infected,
    RecoveredStatus() => HealthStatusKind.recovered,
  };
}
