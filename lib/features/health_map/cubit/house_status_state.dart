part of 'house_status_cubit.dart';

/// Progress of a single house-status change. Every non-idle state names the
/// house it concerns, so a view can ignore updates about other houses.
@freezed
sealed class HouseStatusState with _$HouseStatusState {
  const factory HouseStatusState.idle() = HouseStatusIdle;

  const factory HouseStatusState.saving({
    required String houseId,
    required HealthStatus status,
  }) = HouseStatusSaving;

  const factory HouseStatusState.success({
    required String houseId,
    required HealthStatus status,
  }) = HouseStatusSuccess;

  const factory HouseStatusState.failure({
    required String houseId,
    required String message,
  }) = HouseStatusFailure;
}
