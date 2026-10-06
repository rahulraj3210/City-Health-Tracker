// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$House {

 String get id; String get blockId; String get label; int get row; int get col; int get occupants; HealthStatus get status; DateTime? get updatedAt;
/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseCopyWith<House> get copyWith => _$HouseCopyWithImpl<House>(this as House, _$identity);

  /// Serializes this House to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as House;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is House&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.blockId, _this.blockId) || other.blockId == _this.blockId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.row, _this.row) || other.row == _this.row)&&(identical(other.col, _this.col) || other.col == _this.col)&&(identical(other.occupants, _this.occupants) || other.occupants == _this.occupants)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as House;
  return Object.hash(runtimeType,_this.id,_this.blockId,_this.label,_this.row,_this.col,_this.occupants,_this.status,_this.updatedAt);
}

@override
String toString() {
  final _this = this as House;
  return 'House(id: ${_this.id}, blockId: ${_this.blockId}, label: ${_this.label}, row: ${_this.row}, col: ${_this.col}, occupants: ${_this.occupants}, status: ${_this.status}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $HouseCopyWith<$Res>  {
  factory $HouseCopyWith(House value, $Res Function(House) _then) = _$HouseCopyWithImpl;
@useResult
$Res call({
 String id, String blockId, String label, int row, int col, int occupants, HealthStatus status, DateTime? updatedAt
});


$HealthStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$HouseCopyWithImpl<$Res>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._self, this._then);

  final House _self;
  final $Res Function(House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? blockId = null,Object? label = null,Object? row = null,Object? col = null,Object? occupants = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(House(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,occupants: null == occupants ? _self.occupants : occupants // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthStatusCopyWith<$Res> get status {
  
  return $HealthStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [House].
extension HousePatterns on House {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _House value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _House value)  $default,){
final _that = this;
switch (_that) {
case _House():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _House value)?  $default,){
final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String blockId,  String label,  int row,  int col,  int occupants,  HealthStatus status,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.blockId,_that.label,_that.row,_that.col,_that.occupants,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String blockId,  String label,  int row,  int col,  int occupants,  HealthStatus status,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _House():
return $default(_that.id,_that.blockId,_that.label,_that.row,_that.col,_that.occupants,_that.status,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String blockId,  String label,  int row,  int col,  int occupants,  HealthStatus status,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.blockId,_that.label,_that.row,_that.col,_that.occupants,_that.status,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _House extends House {
  const _House({required this.id, required this.blockId, required this.label, required this.row, required this.col, this.occupants = 1, this.status = const HealthStatus.healthy(), this.updatedAt}): super._();
  factory _House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

@override final  String id;
@override final  String blockId;
@override final  String label;
@override final  int row;
@override final  int col;
@override@JsonKey() final  int occupants;
@override@JsonKey() final  HealthStatus status;
@override final  DateTime? updatedAt;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseCopyWith<_House> get copyWith => __$HouseCopyWithImpl<_House>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _House&&(identical(other.id, id) || other.id == id)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.label, label) || other.label == label)&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.occupants, occupants) || other.occupants == occupants)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,blockId,label,row,col,occupants,status,updatedAt);
}

@override
String toString() {
    return 'House(id: $id, blockId: $blockId, label: $label, row: $row, col: $col, occupants: $occupants, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HouseCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$HouseCopyWith(_House value, $Res Function(_House) _then) = __$HouseCopyWithImpl;
@override @useResult
$Res call({
 String id, String blockId, String label, int row, int col, int occupants, HealthStatus status, DateTime? updatedAt
});


@override $HealthStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$HouseCopyWithImpl<$Res>
    implements _$HouseCopyWith<$Res> {
  __$HouseCopyWithImpl(this._self, this._then);

  final _House _self;
  final $Res Function(_House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? blockId = null,Object? label = null,Object? row = null,Object? col = null,Object? occupants = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(_House(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,occupants: null == occupants ? _self.occupants : occupants // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthStatusCopyWith<$Res> get status {
  
  return $HealthStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
