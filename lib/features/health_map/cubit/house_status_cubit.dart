import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/models.dart';
import '../services/city_health_service.dart';

part 'house_status_cubit.freezed.dart';
part 'house_status_state.dart';

/// Mediates house-status edits between the UI and [CityHealthService].
///
/// It only tracks the write itself. The new status reaches the map through
/// [CityHealthCubit]'s live subscription, which then recomputes clusters,
/// risk and city stats.
class HouseStatusCubit extends Cubit<HouseStatusState> {
  HouseStatusCubit(this._service, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now,
      super(const HouseStatusState.idle());

  final CityHealthService _service;
  final DateTime Function() _clock;

  /// Sets [house] to [kind] (with [severity] when infected). Does nothing if
  /// that is already its status or another save is in flight.
  Future<void> changeStatus(
    House house,
    HealthStatusKind kind, {
    InfectionSeverity severity = InfectionSeverity.mild,
  }) async {
    if (state is HouseStatusSaving) return;
    if (!isChange(house, kind, severity: severity)) return;
    final next = buildStatus(house.status, kind, severity: severity);

    emit(HouseStatusState.saving(houseId: house.id, status: next));
    try {
      await _service.updateHouseStatus(
        blockId: house.blockId,
        houseId: house.id,
        status: next,
      );
      if (!isClosed) {
        emit(HouseStatusState.success(houseId: house.id, status: next));
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      if (!isClosed) {
        emit(
          HouseStatusState.failure(
            houseId: house.id,
            message: error is CityHealthServiceException
                ? error.message
                : 'Could not save the change.',
          ),
        );
      }
    }
  }

  /// Whether choosing [kind]/[severity] would actually change [house].
  bool isChange(
    House house,
    HealthStatusKind kind, {
    InfectionSeverity severity = InfectionSeverity.mild,
  }) => buildStatus(house.status, kind, severity: severity) != house.status;

  /// Clears a finished save, e.g. when a different house is opened.
  void reset() {
    if (state is! HouseStatusSaving) emit(const HouseStatusState.idle());
  }

  /// Builds the status to write. If the kind is unchanged, its original date
  /// is kept (e.g. changing only severity keeps `confirmedAt`); otherwise the
  /// new state is dated now.
  HealthStatus buildStatus(
    HealthStatus current,
    HealthStatusKind kind, {
    InfectionSeverity severity = InfectionSeverity.mild,
  }) {
    final now = _clock().toUtc();
    return switch ((kind, current)) {
      (HealthStatusKind.healthy, _) => const HealthStatus.healthy(),
      (HealthStatusKind.suspected, final SuspectedStatus s) => s,
      (HealthStatusKind.suspected, _) => HealthStatus.suspected(
        reportedAt: now,
      ),
      (HealthStatusKind.infected, final InfectedStatus s) => s.copyWith(
        severity: severity,
      ),
      (HealthStatusKind.infected, _) => HealthStatus.infected(
        confirmedAt: now,
        severity: severity,
      ),
      (HealthStatusKind.recovered, final RecoveredStatus s) => s,
      (HealthStatusKind.recovered, _) => HealthStatus.recovered(
        recoveredAt: now,
      ),
    };
  }
}
