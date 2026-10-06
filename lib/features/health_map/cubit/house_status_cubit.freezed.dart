// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HouseStatusState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HouseStatusState()';
}


}

/// @nodoc
class $HouseStatusStateCopyWith<$Res>  {
$HouseStatusStateCopyWith(HouseStatusState _, $Res Function(HouseStatusState) __);
}


/// Adds pattern-matching-related methods to [HouseStatusState].
extension HouseStatusStatePatterns on HouseStatusState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HouseStatusIdle value)?  idle,TResult Function( HouseStatusSaving value)?  saving,TResult Function( HouseStatusSuccess value)?  success,TResult Function( HouseStatusFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HouseStatusIdle() when idle != null:
return idle(_that);case HouseStatusSaving() when saving != null:
return saving(_that);case HouseStatusSuccess() when success != null:
return success(_that);case HouseStatusFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HouseStatusIdle value)  idle,required TResult Function( HouseStatusSaving value)  saving,required TResult Function( HouseStatusSuccess value)  success,required TResult Function( HouseStatusFailure value)  failure,}){
final _that = this;
switch (_that) {
case HouseStatusIdle():
return idle(_that);case HouseStatusSaving():
return saving(_that);case HouseStatusSuccess():
return success(_that);case HouseStatusFailure():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HouseStatusIdle value)?  idle,TResult? Function( HouseStatusSaving value)?  saving,TResult? Function( HouseStatusSuccess value)?  success,TResult? Function( HouseStatusFailure value)?  failure,}){
final _that = this;
switch (_that) {
case HouseStatusIdle() when idle != null:
return idle(_that);case HouseStatusSaving() when saving != null:
return saving(_that);case HouseStatusSuccess() when success != null:
return success(_that);case HouseStatusFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( String houseId,  HealthStatus status)?  saving,TResult Function( String houseId,  HealthStatus status)?  success,TResult Function( String houseId,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HouseStatusIdle() when idle != null:
return idle();case HouseStatusSaving() when saving != null:
return saving(_that.houseId,_that.status);case HouseStatusSuccess() when success != null:
return success(_that.houseId,_that.status);case HouseStatusFailure() when failure != null:
return failure(_that.houseId,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( String houseId,  HealthStatus status)  saving,required TResult Function( String houseId,  HealthStatus status)  success,required TResult Function( String houseId,  String message)  failure,}) {final _that = this;
switch (_that) {
case HouseStatusIdle():
return idle();case HouseStatusSaving():
return saving(_that.houseId,_that.status);case HouseStatusSuccess():
return success(_that.houseId,_that.status);case HouseStatusFailure():
return failure(_that.houseId,_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( String houseId,  HealthStatus status)?  saving,TResult? Function( String houseId,  HealthStatus status)?  success,TResult? Function( String houseId,  String message)?  failure,}) {final _that = this;
switch (_that) {
case HouseStatusIdle() when idle != null:
return idle();case HouseStatusSaving() when saving != null:
return saving(_that.houseId,_that.status);case HouseStatusSuccess() when success != null:
return success(_that.houseId,_that.status);case HouseStatusFailure() when failure != null:
return failure(_that.houseId,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HouseStatusIdle implements HouseStatusState {
  const HouseStatusIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseStatusIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HouseStatusState.idle()';
}


}




/// @nodoc


class HouseStatusSaving implements HouseStatusState {
  const HouseStatusSaving({required this.houseId, required this.status});
  

 final  String houseId;
 final  HealthStatus status;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseStatusSavingCopyWith<HouseStatusSaving> get copyWith => _$HouseStatusSavingCopyWithImpl<HouseStatusSaving>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseStatusSaving&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,houseId,status);
}

@override
String toString() {
    return 'HouseStatusState.saving(houseId: $houseId, status: $status)';
}


}

/// @nodoc
abstract mixin class $HouseStatusSavingCopyWith<$Res> implements $HouseStatusStateCopyWith<$Res> {
  factory $HouseStatusSavingCopyWith(HouseStatusSaving value, $Res Function(HouseStatusSaving) _then) = _$HouseStatusSavingCopyWithImpl;
@useResult
$Res call({
 String houseId, HealthStatus status
});


$HealthStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$HouseStatusSavingCopyWithImpl<$Res>
    implements $HouseStatusSavingCopyWith<$Res> {
  _$HouseStatusSavingCopyWithImpl(this._self, this._then);

  final HouseStatusSaving _self;
  final $Res Function(HouseStatusSaving) _then;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? houseId = null,Object? status = null,}) {
  return _then(HouseStatusSaving(
houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,
  ));
}

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthStatusCopyWith<$Res> get status {
  
  return $HealthStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc


class HouseStatusSuccess implements HouseStatusState {
  const HouseStatusSuccess({required this.houseId, required this.status});
  

 final  String houseId;
 final  HealthStatus status;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseStatusSuccessCopyWith<HouseStatusSuccess> get copyWith => _$HouseStatusSuccessCopyWithImpl<HouseStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseStatusSuccess&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,houseId,status);
}

@override
String toString() {
    return 'HouseStatusState.success(houseId: $houseId, status: $status)';
}


}

/// @nodoc
abstract mixin class $HouseStatusSuccessCopyWith<$Res> implements $HouseStatusStateCopyWith<$Res> {
  factory $HouseStatusSuccessCopyWith(HouseStatusSuccess value, $Res Function(HouseStatusSuccess) _then) = _$HouseStatusSuccessCopyWithImpl;
@useResult
$Res call({
 String houseId, HealthStatus status
});


$HealthStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$HouseStatusSuccessCopyWithImpl<$Res>
    implements $HouseStatusSuccessCopyWith<$Res> {
  _$HouseStatusSuccessCopyWithImpl(this._self, this._then);

  final HouseStatusSuccess _self;
  final $Res Function(HouseStatusSuccess) _then;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? houseId = null,Object? status = null,}) {
  return _then(HouseStatusSuccess(
houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,
  ));
}

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthStatusCopyWith<$Res> get status {
  
  return $HealthStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc


class HouseStatusFailure implements HouseStatusState {
  const HouseStatusFailure({required this.houseId, required this.message});
  

 final  String houseId;
 final  String message;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseStatusFailureCopyWith<HouseStatusFailure> get copyWith => _$HouseStatusFailureCopyWithImpl<HouseStatusFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseStatusFailure&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,houseId,message);
}

@override
String toString() {
    return 'HouseStatusState.failure(houseId: $houseId, message: $message)';
}


}

/// @nodoc
abstract mixin class $HouseStatusFailureCopyWith<$Res> implements $HouseStatusStateCopyWith<$Res> {
  factory $HouseStatusFailureCopyWith(HouseStatusFailure value, $Res Function(HouseStatusFailure) _then) = _$HouseStatusFailureCopyWithImpl;
@useResult
$Res call({
 String houseId, String message
});




}
/// @nodoc
class _$HouseStatusFailureCopyWithImpl<$Res>
    implements $HouseStatusFailureCopyWith<$Res> {
  _$HouseStatusFailureCopyWithImpl(this._self, this._then);

  final HouseStatusFailure _self;
  final $Res Function(HouseStatusFailure) _then;

/// Create a copy of HouseStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? houseId = null,Object? message = null,}) {
  return _then(HouseStatusFailure(
houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
