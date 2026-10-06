// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infection_cluster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InfectionCluster {

 String get id; String get blockId; List<String> get houseIds; int get minRow; int get maxRow; int get minCol; int get maxCol; InfectionSeverity get peakSeverity;
/// Create a copy of InfectionCluster
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfectionClusterCopyWith<InfectionCluster> get copyWith => _$InfectionClusterCopyWithImpl<InfectionCluster>(this as InfectionCluster, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InfectionCluster;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfectionCluster&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.blockId, _this.blockId) || other.blockId == _this.blockId)&&const DeepCollectionEquality().equals(other.houseIds, _this.houseIds)&&(identical(other.minRow, _this.minRow) || other.minRow == _this.minRow)&&(identical(other.maxRow, _this.maxRow) || other.maxRow == _this.maxRow)&&(identical(other.minCol, _this.minCol) || other.minCol == _this.minCol)&&(identical(other.maxCol, _this.maxCol) || other.maxCol == _this.maxCol)&&(identical(other.peakSeverity, _this.peakSeverity) || other.peakSeverity == _this.peakSeverity));
}


@override
int get hashCode {
  final _this = this as InfectionCluster;
  return Object.hash(runtimeType,_this.id,_this.blockId,const DeepCollectionEquality().hash(_this.houseIds),_this.minRow,_this.maxRow,_this.minCol,_this.maxCol,_this.peakSeverity);
}

@override
String toString() {
  final _this = this as InfectionCluster;
  return 'InfectionCluster(id: ${_this.id}, blockId: ${_this.blockId}, houseIds: ${_this.houseIds}, minRow: ${_this.minRow}, maxRow: ${_this.maxRow}, minCol: ${_this.minCol}, maxCol: ${_this.maxCol}, peakSeverity: ${_this.peakSeverity})';
}


}

/// @nodoc
abstract mixin class $InfectionClusterCopyWith<$Res>  {
  factory $InfectionClusterCopyWith(InfectionCluster value, $Res Function(InfectionCluster) _then) = _$InfectionClusterCopyWithImpl;
@useResult
$Res call({
 String id, String blockId, List<String> houseIds, int minRow, int maxRow, int minCol, int maxCol, InfectionSeverity peakSeverity
});




}
/// @nodoc
class _$InfectionClusterCopyWithImpl<$Res>
    implements $InfectionClusterCopyWith<$Res> {
  _$InfectionClusterCopyWithImpl(this._self, this._then);

  final InfectionCluster _self;
  final $Res Function(InfectionCluster) _then;

/// Create a copy of InfectionCluster
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? blockId = null,Object? houseIds = null,Object? minRow = null,Object? maxRow = null,Object? minCol = null,Object? maxCol = null,Object? peakSeverity = null,}) {
  return _then(InfectionCluster(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,houseIds: null == houseIds ? _self.houseIds : houseIds // ignore: cast_nullable_to_non_nullable
as List<String>,minRow: null == minRow ? _self.minRow : minRow // ignore: cast_nullable_to_non_nullable
as int,maxRow: null == maxRow ? _self.maxRow : maxRow // ignore: cast_nullable_to_non_nullable
as int,minCol: null == minCol ? _self.minCol : minCol // ignore: cast_nullable_to_non_nullable
as int,maxCol: null == maxCol ? _self.maxCol : maxCol // ignore: cast_nullable_to_non_nullable
as int,peakSeverity: null == peakSeverity ? _self.peakSeverity : peakSeverity // ignore: cast_nullable_to_non_nullable
as InfectionSeverity,
  ));
}

}


/// Adds pattern-matching-related methods to [InfectionCluster].
extension InfectionClusterPatterns on InfectionCluster {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfectionCluster value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfectionCluster() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfectionCluster value)  $default,){
final _that = this;
switch (_that) {
case _InfectionCluster():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfectionCluster value)?  $default,){
final _that = this;
switch (_that) {
case _InfectionCluster() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String blockId,  List<String> houseIds,  int minRow,  int maxRow,  int minCol,  int maxCol,  InfectionSeverity peakSeverity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfectionCluster() when $default != null:
return $default(_that.id,_that.blockId,_that.houseIds,_that.minRow,_that.maxRow,_that.minCol,_that.maxCol,_that.peakSeverity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String blockId,  List<String> houseIds,  int minRow,  int maxRow,  int minCol,  int maxCol,  InfectionSeverity peakSeverity)  $default,) {final _that = this;
switch (_that) {
case _InfectionCluster():
return $default(_that.id,_that.blockId,_that.houseIds,_that.minRow,_that.maxRow,_that.minCol,_that.maxCol,_that.peakSeverity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String blockId,  List<String> houseIds,  int minRow,  int maxRow,  int minCol,  int maxCol,  InfectionSeverity peakSeverity)?  $default,) {final _that = this;
switch (_that) {
case _InfectionCluster() when $default != null:
return $default(_that.id,_that.blockId,_that.houseIds,_that.minRow,_that.maxRow,_that.minCol,_that.maxCol,_that.peakSeverity);case _:
  return null;

}
}

}

/// @nodoc


class _InfectionCluster extends InfectionCluster {
  const _InfectionCluster({required this.id, required this.blockId, required  List<String> houseIds, required this.minRow, required this.maxRow, required this.minCol, required this.maxCol, required this.peakSeverity}): _houseIds = houseIds,super._();
  

@override final  String id;
@override final  String blockId;
 final  List<String> _houseIds;
@override List<String> get houseIds {
  if (_houseIds is EqualUnmodifiableListView) return _houseIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_houseIds);
}

@override final  int minRow;
@override final  int maxRow;
@override final  int minCol;
@override final  int maxCol;
@override final  InfectionSeverity peakSeverity;

/// Create a copy of InfectionCluster
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfectionClusterCopyWith<_InfectionCluster> get copyWith => __$InfectionClusterCopyWithImpl<_InfectionCluster>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfectionCluster&&(identical(other.id, id) || other.id == id)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&const DeepCollectionEquality().equals(other.houseIds, _houseIds)&&(identical(other.minRow, minRow) || other.minRow == minRow)&&(identical(other.maxRow, maxRow) || other.maxRow == maxRow)&&(identical(other.minCol, minCol) || other.minCol == minCol)&&(identical(other.maxCol, maxCol) || other.maxCol == maxCol)&&(identical(other.peakSeverity, peakSeverity) || other.peakSeverity == peakSeverity));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,blockId,const DeepCollectionEquality().hash(_houseIds),minRow,maxRow,minCol,maxCol,peakSeverity);
}

@override
String toString() {
    return 'InfectionCluster(id: $id, blockId: $blockId, houseIds: $houseIds, minRow: $minRow, maxRow: $maxRow, minCol: $minCol, maxCol: $maxCol, peakSeverity: $peakSeverity)';
}


}

/// @nodoc
abstract mixin class _$InfectionClusterCopyWith<$Res> implements $InfectionClusterCopyWith<$Res> {
  factory _$InfectionClusterCopyWith(_InfectionCluster value, $Res Function(_InfectionCluster) _then) = __$InfectionClusterCopyWithImpl;
@override @useResult
$Res call({
 String id, String blockId, List<String> houseIds, int minRow, int maxRow, int minCol, int maxCol, InfectionSeverity peakSeverity
});




}
/// @nodoc
class __$InfectionClusterCopyWithImpl<$Res>
    implements _$InfectionClusterCopyWith<$Res> {
  __$InfectionClusterCopyWithImpl(this._self, this._then);

  final _InfectionCluster _self;
  final $Res Function(_InfectionCluster) _then;

/// Create a copy of InfectionCluster
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? blockId = null,Object? houseIds = null,Object? minRow = null,Object? maxRow = null,Object? minCol = null,Object? maxCol = null,Object? peakSeverity = null,}) {
  return _then(_InfectionCluster(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,houseIds: null == houseIds ? _self._houseIds : houseIds // ignore: cast_nullable_to_non_nullable
as List<String>,minRow: null == minRow ? _self.minRow : minRow // ignore: cast_nullable_to_non_nullable
as int,maxRow: null == maxRow ? _self.maxRow : maxRow // ignore: cast_nullable_to_non_nullable
as int,minCol: null == minCol ? _self.minCol : minCol // ignore: cast_nullable_to_non_nullable
as int,maxCol: null == maxCol ? _self.maxCol : maxCol // ignore: cast_nullable_to_non_nullable
as int,peakSeverity: null == peakSeverity ? _self.peakSeverity : peakSeverity // ignore: cast_nullable_to_non_nullable
as InfectionSeverity,
  ));
}


}

// dart format on
