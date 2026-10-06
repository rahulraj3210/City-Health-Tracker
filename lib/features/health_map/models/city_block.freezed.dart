// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityBlock {

 String get id; String get name; String get zone; int get gridRow; int get gridCol; int get houseRows; int get houseCols;@JsonKey(includeFromJson: false, includeToJson: false) List<House> get houses;
/// Create a copy of CityBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityBlockCopyWith<CityBlock> get copyWith => _$CityBlockCopyWithImpl<CityBlock>(this as CityBlock, _$identity);

  /// Serializes this CityBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CityBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityBlock&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.zone, _this.zone) || other.zone == _this.zone)&&(identical(other.gridRow, _this.gridRow) || other.gridRow == _this.gridRow)&&(identical(other.gridCol, _this.gridCol) || other.gridCol == _this.gridCol)&&(identical(other.houseRows, _this.houseRows) || other.houseRows == _this.houseRows)&&(identical(other.houseCols, _this.houseCols) || other.houseCols == _this.houseCols)&&const DeepCollectionEquality().equals(other.houses, _this.houses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CityBlock;
  return Object.hash(runtimeType,_this.id,_this.name,_this.zone,_this.gridRow,_this.gridCol,_this.houseRows,_this.houseCols,const DeepCollectionEquality().hash(_this.houses));
}

@override
String toString() {
  final _this = this as CityBlock;
  return 'CityBlock(id: ${_this.id}, name: ${_this.name}, zone: ${_this.zone}, gridRow: ${_this.gridRow}, gridCol: ${_this.gridCol}, houseRows: ${_this.houseRows}, houseCols: ${_this.houseCols}, houses: ${_this.houses})';
}


}

/// @nodoc
abstract mixin class $CityBlockCopyWith<$Res>  {
  factory $CityBlockCopyWith(CityBlock value, $Res Function(CityBlock) _then) = _$CityBlockCopyWithImpl;
@useResult
$Res call({
 String id, String name, String zone, int gridRow, int gridCol, int houseRows, int houseCols,@JsonKey(includeFromJson: false, includeToJson: false) List<House> houses
});




}
/// @nodoc
class _$CityBlockCopyWithImpl<$Res>
    implements $CityBlockCopyWith<$Res> {
  _$CityBlockCopyWithImpl(this._self, this._then);

  final CityBlock _self;
  final $Res Function(CityBlock) _then;

/// Create a copy of CityBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? zone = null,Object? gridRow = null,Object? gridCol = null,Object? houseRows = null,Object? houseCols = null,Object? houses = null,}) {
  return _then(CityBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,zone: null == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String,gridRow: null == gridRow ? _self.gridRow : gridRow // ignore: cast_nullable_to_non_nullable
as int,gridCol: null == gridCol ? _self.gridCol : gridCol // ignore: cast_nullable_to_non_nullable
as int,houseRows: null == houseRows ? _self.houseRows : houseRows // ignore: cast_nullable_to_non_nullable
as int,houseCols: null == houseCols ? _self.houseCols : houseCols // ignore: cast_nullable_to_non_nullable
as int,houses: null == houses ? _self.houses : houses // ignore: cast_nullable_to_non_nullable
as List<House>,
  ));
}

}


/// Adds pattern-matching-related methods to [CityBlock].
extension CityBlockPatterns on CityBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityBlock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityBlock value)  $default,){
final _that = this;
switch (_that) {
case _CityBlock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityBlock value)?  $default,){
final _that = this;
switch (_that) {
case _CityBlock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String zone,  int gridRow,  int gridCol,  int houseRows,  int houseCols, @JsonKey(includeFromJson: false, includeToJson: false)  List<House> houses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityBlock() when $default != null:
return $default(_that.id,_that.name,_that.zone,_that.gridRow,_that.gridCol,_that.houseRows,_that.houseCols,_that.houses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String zone,  int gridRow,  int gridCol,  int houseRows,  int houseCols, @JsonKey(includeFromJson: false, includeToJson: false)  List<House> houses)  $default,) {final _that = this;
switch (_that) {
case _CityBlock():
return $default(_that.id,_that.name,_that.zone,_that.gridRow,_that.gridCol,_that.houseRows,_that.houseCols,_that.houses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String zone,  int gridRow,  int gridCol,  int houseRows,  int houseCols, @JsonKey(includeFromJson: false, includeToJson: false)  List<House> houses)?  $default,) {final _that = this;
switch (_that) {
case _CityBlock() when $default != null:
return $default(_that.id,_that.name,_that.zone,_that.gridRow,_that.gridCol,_that.houseRows,_that.houseCols,_that.houses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityBlock implements CityBlock {
  const _CityBlock({required this.id, required this.name, required this.zone, required this.gridRow, required this.gridCol, required this.houseRows, required this.houseCols, @JsonKey(includeFromJson: false, includeToJson: false)  List<House> houses = const <House>[]}): _houses = houses;
  factory _CityBlock.fromJson(Map<String, dynamic> json) => _$CityBlockFromJson(json);

@override final  String id;
@override final  String name;
@override final  String zone;
@override final  int gridRow;
@override final  int gridCol;
@override final  int houseRows;
@override final  int houseCols;
 final  List<House> _houses;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<House> get houses {
  if (_houses is EqualUnmodifiableListView) return _houses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_houses);
}


/// Create a copy of CityBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityBlockCopyWith<_CityBlock> get copyWith => __$CityBlockCopyWithImpl<_CityBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.gridRow, gridRow) || other.gridRow == gridRow)&&(identical(other.gridCol, gridCol) || other.gridCol == gridCol)&&(identical(other.houseRows, houseRows) || other.houseRows == houseRows)&&(identical(other.houseCols, houseCols) || other.houseCols == houseCols)&&const DeepCollectionEquality().equals(other.houses, _houses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,zone,gridRow,gridCol,houseRows,houseCols,const DeepCollectionEquality().hash(_houses));
}

@override
String toString() {
    return 'CityBlock(id: $id, name: $name, zone: $zone, gridRow: $gridRow, gridCol: $gridCol, houseRows: $houseRows, houseCols: $houseCols, houses: $houses)';
}


}

/// @nodoc
abstract mixin class _$CityBlockCopyWith<$Res> implements $CityBlockCopyWith<$Res> {
  factory _$CityBlockCopyWith(_CityBlock value, $Res Function(_CityBlock) _then) = __$CityBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String zone, int gridRow, int gridCol, int houseRows, int houseCols,@JsonKey(includeFromJson: false, includeToJson: false) List<House> houses
});




}
/// @nodoc
class __$CityBlockCopyWithImpl<$Res>
    implements _$CityBlockCopyWith<$Res> {
  __$CityBlockCopyWithImpl(this._self, this._then);

  final _CityBlock _self;
  final $Res Function(_CityBlock) _then;

/// Create a copy of CityBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? zone = null,Object? gridRow = null,Object? gridCol = null,Object? houseRows = null,Object? houseCols = null,Object? houses = null,}) {
  return _then(_CityBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,zone: null == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String,gridRow: null == gridRow ? _self.gridRow : gridRow // ignore: cast_nullable_to_non_nullable
as int,gridCol: null == gridCol ? _self.gridCol : gridCol // ignore: cast_nullable_to_non_nullable
as int,houseRows: null == houseRows ? _self.houseRows : houseRows // ignore: cast_nullable_to_non_nullable
as int,houseCols: null == houseCols ? _self.houseCols : houseCols // ignore: cast_nullable_to_non_nullable
as int,houses: null == houses ? _self._houses : houses // ignore: cast_nullable_to_non_nullable
as List<House>,
  ));
}


}

// dart format on
