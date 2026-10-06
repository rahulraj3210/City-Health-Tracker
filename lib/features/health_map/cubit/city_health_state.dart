part of 'city_health_cubit.dart';

@freezed
sealed class CityHealthState with _$CityHealthState {
  const factory CityHealthState.initial() = CityHealthInitial;

  const factory CityHealthState.loading() = CityHealthLoading;

  const factory CityHealthState.loaded(CityHealthSnapshot snapshot) =
      CityHealthLoaded;

  const factory CityHealthState.failure(String message) = CityHealthFailure;
}
