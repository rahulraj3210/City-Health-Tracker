// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_health_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthCounts {

 int get healthy; int get suspected; int get infected; int get recovered;
/// Create a copy of HealthCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthCountsCopyWith<HealthCounts> get copyWith => _$HealthCountsCopyWithImpl<HealthCounts>(this as HealthCounts, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HealthCounts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthCounts&&(identical(other.healthy, _this.healthy) || other.healthy == _this.healthy)&&(identical(other.suspected, _this.suspected) || other.suspected == _this.suspected)&&(identical(other.infected, _this.infected) || other.infected == _this.infected)&&(identical(other.recovered, _this.recovered) || other.recovered == _this.recovered));
}


@override
int get hashCode {
  final _this = this as HealthCounts;
  return Object.hash(runtimeType,_this.healthy,_this.suspected,_this.infected,_this.recovered);
}

@override
String toString() {
  final _this = this as HealthCounts;
  return 'HealthCounts(healthy: ${_this.healthy}, suspected: ${_this.suspected}, infected: ${_this.infected}, recovered: ${_this.recovered})';
}


}

/// @nodoc
abstract mixin class $HealthCountsCopyWith<$Res>  {
  factory $HealthCountsCopyWith(HealthCounts value, $Res Function(HealthCounts) _then) = _$HealthCountsCopyWithImpl;
@useResult
$Res call({
 int healthy, int suspected, int infected, int recovered
});




}
/// @nodoc
class _$HealthCountsCopyWithImpl<$Res>
    implements $HealthCountsCopyWith<$Res> {
  _$HealthCountsCopyWithImpl(this._self, this._then);

  final HealthCounts _self;
  final $Res Function(HealthCounts) _then;

/// Create a copy of HealthCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthy = null,Object? suspected = null,Object? infected = null,Object? recovered = null,}) {
  return _then(HealthCounts(
healthy: null == healthy ? _self.healthy : healthy // ignore: cast_nullable_to_non_nullable
as int,suspected: null == suspected ? _self.suspected : suspected // ignore: cast_nullable_to_non_nullable
as int,infected: null == infected ? _self.infected : infected // ignore: cast_nullable_to_non_nullable
as int,recovered: null == recovered ? _self.recovered : recovered // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthCounts].
extension HealthCountsPatterns on HealthCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthCounts value)  $default,){
final _that = this;
switch (_that) {
case _HealthCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthCounts value)?  $default,){
final _that = this;
switch (_that) {
case _HealthCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int healthy,  int suspected,  int infected,  int recovered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthCounts() when $default != null:
return $default(_that.healthy,_that.suspected,_that.infected,_that.recovered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int healthy,  int suspected,  int infected,  int recovered)  $default,) {final _that = this;
switch (_that) {
case _HealthCounts():
return $default(_that.healthy,_that.suspected,_that.infected,_that.recovered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int healthy,  int suspected,  int infected,  int recovered)?  $default,) {final _that = this;
switch (_that) {
case _HealthCounts() when $default != null:
return $default(_that.healthy,_that.suspected,_that.infected,_that.recovered);case _:
  return null;

}
}

}

/// @nodoc


class _HealthCounts extends HealthCounts {
  const _HealthCounts({this.healthy = 0, this.suspected = 0, this.infected = 0, this.recovered = 0}): super._();
  

@override@JsonKey() final  int healthy;
@override@JsonKey() final  int suspected;
@override@JsonKey() final  int infected;
@override@JsonKey() final  int recovered;

/// Create a copy of HealthCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthCountsCopyWith<_HealthCounts> get copyWith => __$HealthCountsCopyWithImpl<_HealthCounts>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthCounts&&(identical(other.healthy, healthy) || other.healthy == healthy)&&(identical(other.suspected, suspected) || other.suspected == suspected)&&(identical(other.infected, infected) || other.infected == infected)&&(identical(other.recovered, recovered) || other.recovered == recovered));
}


@override
int get hashCode {
    return Object.hash(runtimeType,healthy,suspected,infected,recovered);
}

@override
String toString() {
    return 'HealthCounts(healthy: $healthy, suspected: $suspected, infected: $infected, recovered: $recovered)';
}


}

/// @nodoc
abstract mixin class _$HealthCountsCopyWith<$Res> implements $HealthCountsCopyWith<$Res> {
  factory _$HealthCountsCopyWith(_HealthCounts value, $Res Function(_HealthCounts) _then) = __$HealthCountsCopyWithImpl;
@override @useResult
$Res call({
 int healthy, int suspected, int infected, int recovered
});




}
/// @nodoc
class __$HealthCountsCopyWithImpl<$Res>
    implements _$HealthCountsCopyWith<$Res> {
  __$HealthCountsCopyWithImpl(this._self, this._then);

  final _HealthCounts _self;
  final $Res Function(_HealthCounts) _then;

/// Create a copy of HealthCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthy = null,Object? suspected = null,Object? infected = null,Object? recovered = null,}) {
  return _then(_HealthCounts(
healthy: null == healthy ? _self.healthy : healthy // ignore: cast_nullable_to_non_nullable
as int,suspected: null == suspected ? _self.suspected : suspected // ignore: cast_nullable_to_non_nullable
as int,infected: null == infected ? _self.infected : infected // ignore: cast_nullable_to_non_nullable
as int,recovered: null == recovered ? _self.recovered : recovered // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BlockHealthSummary {

 String get blockId; HealthCounts get counts; List<InfectionCluster> get clusters; RiskLevel get riskLevel;/// houseId -> clusterId, for O(1) lookups while rendering houses.
 Map<String, String> get houseClusterIndex;
/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockHealthSummaryCopyWith<BlockHealthSummary> get copyWith => _$BlockHealthSummaryCopyWithImpl<BlockHealthSummary>(this as BlockHealthSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BlockHealthSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockHealthSummary&&(identical(other.blockId, _this.blockId) || other.blockId == _this.blockId)&&(identical(other.counts, _this.counts) || other.counts == _this.counts)&&const DeepCollectionEquality().equals(other.clusters, _this.clusters)&&(identical(other.riskLevel, _this.riskLevel) || other.riskLevel == _this.riskLevel)&&const DeepCollectionEquality().equals(other.houseClusterIndex, _this.houseClusterIndex));
}


@override
int get hashCode {
  final _this = this as BlockHealthSummary;
  return Object.hash(runtimeType,_this.blockId,_this.counts,const DeepCollectionEquality().hash(_this.clusters),_this.riskLevel,const DeepCollectionEquality().hash(_this.houseClusterIndex));
}

@override
String toString() {
  final _this = this as BlockHealthSummary;
  return 'BlockHealthSummary(blockId: ${_this.blockId}, counts: ${_this.counts}, clusters: ${_this.clusters}, riskLevel: ${_this.riskLevel}, houseClusterIndex: ${_this.houseClusterIndex})';
}


}

/// @nodoc
abstract mixin class $BlockHealthSummaryCopyWith<$Res>  {
  factory $BlockHealthSummaryCopyWith(BlockHealthSummary value, $Res Function(BlockHealthSummary) _then) = _$BlockHealthSummaryCopyWithImpl;
@useResult
$Res call({
 String blockId, HealthCounts counts, List<InfectionCluster> clusters, RiskLevel riskLevel, Map<String, String> houseClusterIndex
});


$HealthCountsCopyWith<$Res> get counts;

}
/// @nodoc
class _$BlockHealthSummaryCopyWithImpl<$Res>
    implements $BlockHealthSummaryCopyWith<$Res> {
  _$BlockHealthSummaryCopyWithImpl(this._self, this._then);

  final BlockHealthSummary _self;
  final $Res Function(BlockHealthSummary) _then;

/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockId = null,Object? counts = null,Object? clusters = null,Object? riskLevel = null,Object? houseClusterIndex = null,}) {
  return _then(BlockHealthSummary(
blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HealthCounts,clusters: null == clusters ? _self.clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<InfectionCluster>,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as RiskLevel,houseClusterIndex: null == houseClusterIndex ? _self.houseClusterIndex : houseClusterIndex // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}
/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthCountsCopyWith<$Res> get counts {
  
  return $HealthCountsCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// Adds pattern-matching-related methods to [BlockHealthSummary].
extension BlockHealthSummaryPatterns on BlockHealthSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockHealthSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockHealthSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockHealthSummary value)  $default,){
final _that = this;
switch (_that) {
case _BlockHealthSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockHealthSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BlockHealthSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String blockId,  HealthCounts counts,  List<InfectionCluster> clusters,  RiskLevel riskLevel,  Map<String, String> houseClusterIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockHealthSummary() when $default != null:
return $default(_that.blockId,_that.counts,_that.clusters,_that.riskLevel,_that.houseClusterIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String blockId,  HealthCounts counts,  List<InfectionCluster> clusters,  RiskLevel riskLevel,  Map<String, String> houseClusterIndex)  $default,) {final _that = this;
switch (_that) {
case _BlockHealthSummary():
return $default(_that.blockId,_that.counts,_that.clusters,_that.riskLevel,_that.houseClusterIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String blockId,  HealthCounts counts,  List<InfectionCluster> clusters,  RiskLevel riskLevel,  Map<String, String> houseClusterIndex)?  $default,) {final _that = this;
switch (_that) {
case _BlockHealthSummary() when $default != null:
return $default(_that.blockId,_that.counts,_that.clusters,_that.riskLevel,_that.houseClusterIndex);case _:
  return null;

}
}

}

/// @nodoc


class _BlockHealthSummary extends BlockHealthSummary {
  const _BlockHealthSummary({required this.blockId, required this.counts, required  List<InfectionCluster> clusters, required this.riskLevel, required  Map<String, String> houseClusterIndex}): _clusters = clusters,_houseClusterIndex = houseClusterIndex,super._();
  

@override final  String blockId;
@override final  HealthCounts counts;
 final  List<InfectionCluster> _clusters;
@override List<InfectionCluster> get clusters {
  if (_clusters is EqualUnmodifiableListView) return _clusters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clusters);
}

@override final  RiskLevel riskLevel;
/// houseId -> clusterId, for O(1) lookups while rendering houses.
 final  Map<String, String> _houseClusterIndex;
/// houseId -> clusterId, for O(1) lookups while rendering houses.
@override Map<String, String> get houseClusterIndex {
  if (_houseClusterIndex is EqualUnmodifiableMapView) return _houseClusterIndex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_houseClusterIndex);
}


/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockHealthSummaryCopyWith<_BlockHealthSummary> get copyWith => __$BlockHealthSummaryCopyWithImpl<_BlockHealthSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockHealthSummary&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other.clusters, _clusters)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&const DeepCollectionEquality().equals(other.houseClusterIndex, _houseClusterIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,blockId,counts,const DeepCollectionEquality().hash(_clusters),riskLevel,const DeepCollectionEquality().hash(_houseClusterIndex));
}

@override
String toString() {
    return 'BlockHealthSummary(blockId: $blockId, counts: $counts, clusters: $clusters, riskLevel: $riskLevel, houseClusterIndex: $houseClusterIndex)';
}


}

/// @nodoc
abstract mixin class _$BlockHealthSummaryCopyWith<$Res> implements $BlockHealthSummaryCopyWith<$Res> {
  factory _$BlockHealthSummaryCopyWith(_BlockHealthSummary value, $Res Function(_BlockHealthSummary) _then) = __$BlockHealthSummaryCopyWithImpl;
@override @useResult
$Res call({
 String blockId, HealthCounts counts, List<InfectionCluster> clusters, RiskLevel riskLevel, Map<String, String> houseClusterIndex
});


@override $HealthCountsCopyWith<$Res> get counts;

}
/// @nodoc
class __$BlockHealthSummaryCopyWithImpl<$Res>
    implements _$BlockHealthSummaryCopyWith<$Res> {
  __$BlockHealthSummaryCopyWithImpl(this._self, this._then);

  final _BlockHealthSummary _self;
  final $Res Function(_BlockHealthSummary) _then;

/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blockId = null,Object? counts = null,Object? clusters = null,Object? riskLevel = null,Object? houseClusterIndex = null,}) {
  return _then(_BlockHealthSummary(
blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HealthCounts,clusters: null == clusters ? _self._clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<InfectionCluster>,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as RiskLevel,houseClusterIndex: null == houseClusterIndex ? _self._houseClusterIndex : houseClusterIndex // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of BlockHealthSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthCountsCopyWith<$Res> get counts {
  
  return $HealthCountsCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}

// dart format on
