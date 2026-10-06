// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_health_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityHealthState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CityHealthState()';
}


}

/// @nodoc
class $CityHealthStateCopyWith<$Res>  {
$CityHealthStateCopyWith(CityHealthState _, $Res Function(CityHealthState) __);
}


/// Adds pattern-matching-related methods to [CityHealthState].
extension CityHealthStatePatterns on CityHealthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CityHealthInitial value)?  initial,TResult Function( CityHealthLoading value)?  loading,TResult Function( CityHealthLoaded value)?  loaded,TResult Function( CityHealthFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CityHealthInitial() when initial != null:
return initial(_that);case CityHealthLoading() when loading != null:
return loading(_that);case CityHealthLoaded() when loaded != null:
return loaded(_that);case CityHealthFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CityHealthInitial value)  initial,required TResult Function( CityHealthLoading value)  loading,required TResult Function( CityHealthLoaded value)  loaded,required TResult Function( CityHealthFailure value)  failure,}){
final _that = this;
switch (_that) {
case CityHealthInitial():
return initial(_that);case CityHealthLoading():
return loading(_that);case CityHealthLoaded():
return loaded(_that);case CityHealthFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CityHealthInitial value)?  initial,TResult? Function( CityHealthLoading value)?  loading,TResult? Function( CityHealthLoaded value)?  loaded,TResult? Function( CityHealthFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CityHealthInitial() when initial != null:
return initial(_that);case CityHealthLoading() when loading != null:
return loading(_that);case CityHealthLoaded() when loaded != null:
return loaded(_that);case CityHealthFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CityHealthSnapshot snapshot)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CityHealthInitial() when initial != null:
return initial();case CityHealthLoading() when loading != null:
return loading();case CityHealthLoaded() when loaded != null:
return loaded(_that.snapshot);case CityHealthFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CityHealthSnapshot snapshot)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case CityHealthInitial():
return initial();case CityHealthLoading():
return loading();case CityHealthLoaded():
return loaded(_that.snapshot);case CityHealthFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CityHealthSnapshot snapshot)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case CityHealthInitial() when initial != null:
return initial();case CityHealthLoading() when loading != null:
return loading();case CityHealthLoaded() when loaded != null:
return loaded(_that.snapshot);case CityHealthFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CityHealthInitial implements CityHealthState {
  const CityHealthInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CityHealthState.initial()';
}


}




/// @nodoc


class CityHealthLoading implements CityHealthState {
  const CityHealthLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CityHealthState.loading()';
}


}




/// @nodoc


class CityHealthLoaded implements CityHealthState {
  const CityHealthLoaded(this.snapshot);
  

 final  CityHealthSnapshot snapshot;

/// Create a copy of CityHealthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityHealthLoadedCopyWith<CityHealthLoaded> get copyWith => _$CityHealthLoadedCopyWithImpl<CityHealthLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthLoaded&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot));
}


@override
int get hashCode {
    return Object.hash(runtimeType,snapshot);
}

@override
String toString() {
    return 'CityHealthState.loaded(snapshot: $snapshot)';
}


}

/// @nodoc
abstract mixin class $CityHealthLoadedCopyWith<$Res> implements $CityHealthStateCopyWith<$Res> {
  factory $CityHealthLoadedCopyWith(CityHealthLoaded value, $Res Function(CityHealthLoaded) _then) = _$CityHealthLoadedCopyWithImpl;
@useResult
$Res call({
 CityHealthSnapshot snapshot
});


$CityHealthSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class _$CityHealthLoadedCopyWithImpl<$Res>
    implements $CityHealthLoadedCopyWith<$Res> {
  _$CityHealthLoadedCopyWithImpl(this._self, this._then);

  final CityHealthLoaded _self;
  final $Res Function(CityHealthLoaded) _then;

/// Create a copy of CityHealthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snapshot = null,}) {
  return _then(CityHealthLoaded(
null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as CityHealthSnapshot,
  ));
}

/// Create a copy of CityHealthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityHealthSnapshotCopyWith<$Res> get snapshot {
  
  return $CityHealthSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}

/// @nodoc


class CityHealthFailure implements CityHealthState {
  const CityHealthFailure(this.message);
  

 final  String message;

/// Create a copy of CityHealthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityHealthFailureCopyWith<CityHealthFailure> get copyWith => _$CityHealthFailureCopyWithImpl<CityHealthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'CityHealthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CityHealthFailureCopyWith<$Res> implements $CityHealthStateCopyWith<$Res> {
  factory $CityHealthFailureCopyWith(CityHealthFailure value, $Res Function(CityHealthFailure) _then) = _$CityHealthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CityHealthFailureCopyWithImpl<$Res>
    implements $CityHealthFailureCopyWith<$Res> {
  _$CityHealthFailureCopyWithImpl(this._self, this._then);

  final CityHealthFailure _self;
  final $Res Function(CityHealthFailure) _then;

/// Create a copy of CityHealthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CityHealthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
