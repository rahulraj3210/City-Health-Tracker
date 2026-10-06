// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_health_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityHealthStats {

 int get totalBlocks; HealthCounts get counts; int get totalClusters; int get largestClusterSize; Map<RiskLevel, int> get blocksByRisk;/// High/critical blocks, most at-risk first.
 List<String> get hotspotBlockIds; DateTime? get lastUpdated;
/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityHealthStatsCopyWith<CityHealthStats> get copyWith => _$CityHealthStatsCopyWithImpl<CityHealthStats>(this as CityHealthStats, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CityHealthStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthStats&&(identical(other.totalBlocks, _this.totalBlocks) || other.totalBlocks == _this.totalBlocks)&&(identical(other.counts, _this.counts) || other.counts == _this.counts)&&(identical(other.totalClusters, _this.totalClusters) || other.totalClusters == _this.totalClusters)&&(identical(other.largestClusterSize, _this.largestClusterSize) || other.largestClusterSize == _this.largestClusterSize)&&const DeepCollectionEquality().equals(other.blocksByRisk, _this.blocksByRisk)&&const DeepCollectionEquality().equals(other.hotspotBlockIds, _this.hotspotBlockIds)&&(identical(other.lastUpdated, _this.lastUpdated) || other.lastUpdated == _this.lastUpdated));
}


@override
int get hashCode {
  final _this = this as CityHealthStats;
  return Object.hash(runtimeType,_this.totalBlocks,_this.counts,_this.totalClusters,_this.largestClusterSize,const DeepCollectionEquality().hash(_this.blocksByRisk),const DeepCollectionEquality().hash(_this.hotspotBlockIds),_this.lastUpdated);
}

@override
String toString() {
  final _this = this as CityHealthStats;
  return 'CityHealthStats(totalBlocks: ${_this.totalBlocks}, counts: ${_this.counts}, totalClusters: ${_this.totalClusters}, largestClusterSize: ${_this.largestClusterSize}, blocksByRisk: ${_this.blocksByRisk}, hotspotBlockIds: ${_this.hotspotBlockIds}, lastUpdated: ${_this.lastUpdated})';
}


}

/// @nodoc
abstract mixin class $CityHealthStatsCopyWith<$Res>  {
  factory $CityHealthStatsCopyWith(CityHealthStats value, $Res Function(CityHealthStats) _then) = _$CityHealthStatsCopyWithImpl;
@useResult
$Res call({
 int totalBlocks, HealthCounts counts, int totalClusters, int largestClusterSize, Map<RiskLevel, int> blocksByRisk, List<String> hotspotBlockIds, DateTime? lastUpdated
});


$HealthCountsCopyWith<$Res> get counts;

}
/// @nodoc
class _$CityHealthStatsCopyWithImpl<$Res>
    implements $CityHealthStatsCopyWith<$Res> {
  _$CityHealthStatsCopyWithImpl(this._self, this._then);

  final CityHealthStats _self;
  final $Res Function(CityHealthStats) _then;

/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBlocks = null,Object? counts = null,Object? totalClusters = null,Object? largestClusterSize = null,Object? blocksByRisk = null,Object? hotspotBlockIds = null,Object? lastUpdated = freezed,}) {
  return _then(CityHealthStats(
totalBlocks: null == totalBlocks ? _self.totalBlocks : totalBlocks // ignore: cast_nullable_to_non_nullable
as int,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HealthCounts,totalClusters: null == totalClusters ? _self.totalClusters : totalClusters // ignore: cast_nullable_to_non_nullable
as int,largestClusterSize: null == largestClusterSize ? _self.largestClusterSize : largestClusterSize // ignore: cast_nullable_to_non_nullable
as int,blocksByRisk: null == blocksByRisk ? _self.blocksByRisk : blocksByRisk // ignore: cast_nullable_to_non_nullable
as Map<RiskLevel, int>,hotspotBlockIds: null == hotspotBlockIds ? _self.hotspotBlockIds : hotspotBlockIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthCountsCopyWith<$Res> get counts {
  
  return $HealthCountsCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityHealthStats].
extension CityHealthStatsPatterns on CityHealthStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityHealthStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityHealthStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityHealthStats value)  $default,){
final _that = this;
switch (_that) {
case _CityHealthStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityHealthStats value)?  $default,){
final _that = this;
switch (_that) {
case _CityHealthStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBlocks,  HealthCounts counts,  int totalClusters,  int largestClusterSize,  Map<RiskLevel, int> blocksByRisk,  List<String> hotspotBlockIds,  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityHealthStats() when $default != null:
return $default(_that.totalBlocks,_that.counts,_that.totalClusters,_that.largestClusterSize,_that.blocksByRisk,_that.hotspotBlockIds,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBlocks,  HealthCounts counts,  int totalClusters,  int largestClusterSize,  Map<RiskLevel, int> blocksByRisk,  List<String> hotspotBlockIds,  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _CityHealthStats():
return $default(_that.totalBlocks,_that.counts,_that.totalClusters,_that.largestClusterSize,_that.blocksByRisk,_that.hotspotBlockIds,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBlocks,  HealthCounts counts,  int totalClusters,  int largestClusterSize,  Map<RiskLevel, int> blocksByRisk,  List<String> hotspotBlockIds,  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _CityHealthStats() when $default != null:
return $default(_that.totalBlocks,_that.counts,_that.totalClusters,_that.largestClusterSize,_that.blocksByRisk,_that.hotspotBlockIds,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _CityHealthStats implements CityHealthStats {
  const _CityHealthStats({required this.totalBlocks, required this.counts, required this.totalClusters, required this.largestClusterSize, required  Map<RiskLevel, int> blocksByRisk, required  List<String> hotspotBlockIds, this.lastUpdated}): _blocksByRisk = blocksByRisk,_hotspotBlockIds = hotspotBlockIds;
  

@override final  int totalBlocks;
@override final  HealthCounts counts;
@override final  int totalClusters;
@override final  int largestClusterSize;
 final  Map<RiskLevel, int> _blocksByRisk;
@override Map<RiskLevel, int> get blocksByRisk {
  if (_blocksByRisk is EqualUnmodifiableMapView) return _blocksByRisk;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_blocksByRisk);
}

/// High/critical blocks, most at-risk first.
 final  List<String> _hotspotBlockIds;
/// High/critical blocks, most at-risk first.
@override List<String> get hotspotBlockIds {
  if (_hotspotBlockIds is EqualUnmodifiableListView) return _hotspotBlockIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotspotBlockIds);
}

@override final  DateTime? lastUpdated;

/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityHealthStatsCopyWith<_CityHealthStats> get copyWith => __$CityHealthStatsCopyWithImpl<_CityHealthStats>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityHealthStats&&(identical(other.totalBlocks, totalBlocks) || other.totalBlocks == totalBlocks)&&(identical(other.counts, counts) || other.counts == counts)&&(identical(other.totalClusters, totalClusters) || other.totalClusters == totalClusters)&&(identical(other.largestClusterSize, largestClusterSize) || other.largestClusterSize == largestClusterSize)&&const DeepCollectionEquality().equals(other.blocksByRisk, _blocksByRisk)&&const DeepCollectionEquality().equals(other.hotspotBlockIds, _hotspotBlockIds)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode {
    return Object.hash(runtimeType,totalBlocks,counts,totalClusters,largestClusterSize,const DeepCollectionEquality().hash(_blocksByRisk),const DeepCollectionEquality().hash(_hotspotBlockIds),lastUpdated);
}

@override
String toString() {
    return 'CityHealthStats(totalBlocks: $totalBlocks, counts: $counts, totalClusters: $totalClusters, largestClusterSize: $largestClusterSize, blocksByRisk: $blocksByRisk, hotspotBlockIds: $hotspotBlockIds, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$CityHealthStatsCopyWith<$Res> implements $CityHealthStatsCopyWith<$Res> {
  factory _$CityHealthStatsCopyWith(_CityHealthStats value, $Res Function(_CityHealthStats) _then) = __$CityHealthStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalBlocks, HealthCounts counts, int totalClusters, int largestClusterSize, Map<RiskLevel, int> blocksByRisk, List<String> hotspotBlockIds, DateTime? lastUpdated
});


@override $HealthCountsCopyWith<$Res> get counts;

}
/// @nodoc
class __$CityHealthStatsCopyWithImpl<$Res>
    implements _$CityHealthStatsCopyWith<$Res> {
  __$CityHealthStatsCopyWithImpl(this._self, this._then);

  final _CityHealthStats _self;
  final $Res Function(_CityHealthStats) _then;

/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBlocks = null,Object? counts = null,Object? totalClusters = null,Object? largestClusterSize = null,Object? blocksByRisk = null,Object? hotspotBlockIds = null,Object? lastUpdated = freezed,}) {
  return _then(_CityHealthStats(
totalBlocks: null == totalBlocks ? _self.totalBlocks : totalBlocks // ignore: cast_nullable_to_non_nullable
as int,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as HealthCounts,totalClusters: null == totalClusters ? _self.totalClusters : totalClusters // ignore: cast_nullable_to_non_nullable
as int,largestClusterSize: null == largestClusterSize ? _self.largestClusterSize : largestClusterSize // ignore: cast_nullable_to_non_nullable
as int,blocksByRisk: null == blocksByRisk ? _self._blocksByRisk : blocksByRisk // ignore: cast_nullable_to_non_nullable
as Map<RiskLevel, int>,hotspotBlockIds: null == hotspotBlockIds ? _self._hotspotBlockIds : hotspotBlockIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CityHealthStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthCountsCopyWith<$Res> get counts {
  
  return $HealthCountsCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}

/// @nodoc
mixin _$CityHealthSnapshot {

 List<CityBlock> get blocks; Map<String, BlockHealthSummary> get summaries; CityHealthStats get stats; int get gridRows; int get gridCols;
/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityHealthSnapshotCopyWith<CityHealthSnapshot> get copyWith => _$CityHealthSnapshotCopyWithImpl<CityHealthSnapshot>(this as CityHealthSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CityHealthSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityHealthSnapshot&&const DeepCollectionEquality().equals(other.blocks, _this.blocks)&&const DeepCollectionEquality().equals(other.summaries, _this.summaries)&&(identical(other.stats, _this.stats) || other.stats == _this.stats)&&(identical(other.gridRows, _this.gridRows) || other.gridRows == _this.gridRows)&&(identical(other.gridCols, _this.gridCols) || other.gridCols == _this.gridCols));
}


@override
int get hashCode {
  final _this = this as CityHealthSnapshot;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.blocks),const DeepCollectionEquality().hash(_this.summaries),_this.stats,_this.gridRows,_this.gridCols);
}

@override
String toString() {
  final _this = this as CityHealthSnapshot;
  return 'CityHealthSnapshot(blocks: ${_this.blocks}, summaries: ${_this.summaries}, stats: ${_this.stats}, gridRows: ${_this.gridRows}, gridCols: ${_this.gridCols})';
}


}

/// @nodoc
abstract mixin class $CityHealthSnapshotCopyWith<$Res>  {
  factory $CityHealthSnapshotCopyWith(CityHealthSnapshot value, $Res Function(CityHealthSnapshot) _then) = _$CityHealthSnapshotCopyWithImpl;
@useResult
$Res call({
 List<CityBlock> blocks, Map<String, BlockHealthSummary> summaries, CityHealthStats stats, int gridRows, int gridCols
});


$CityHealthStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$CityHealthSnapshotCopyWithImpl<$Res>
    implements $CityHealthSnapshotCopyWith<$Res> {
  _$CityHealthSnapshotCopyWithImpl(this._self, this._then);

  final CityHealthSnapshot _self;
  final $Res Function(CityHealthSnapshot) _then;

/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blocks = null,Object? summaries = null,Object? stats = null,Object? gridRows = null,Object? gridCols = null,}) {
  return _then(CityHealthSnapshot(
blocks: null == blocks ? _self.blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<CityBlock>,summaries: null == summaries ? _self.summaries : summaries // ignore: cast_nullable_to_non_nullable
as Map<String, BlockHealthSummary>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as CityHealthStats,gridRows: null == gridRows ? _self.gridRows : gridRows // ignore: cast_nullable_to_non_nullable
as int,gridCols: null == gridCols ? _self.gridCols : gridCols // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityHealthStatsCopyWith<$Res> get stats {
  
  return $CityHealthStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityHealthSnapshot].
extension CityHealthSnapshotPatterns on CityHealthSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityHealthSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityHealthSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityHealthSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _CityHealthSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityHealthSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _CityHealthSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CityBlock> blocks,  Map<String, BlockHealthSummary> summaries,  CityHealthStats stats,  int gridRows,  int gridCols)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityHealthSnapshot() when $default != null:
return $default(_that.blocks,_that.summaries,_that.stats,_that.gridRows,_that.gridCols);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CityBlock> blocks,  Map<String, BlockHealthSummary> summaries,  CityHealthStats stats,  int gridRows,  int gridCols)  $default,) {final _that = this;
switch (_that) {
case _CityHealthSnapshot():
return $default(_that.blocks,_that.summaries,_that.stats,_that.gridRows,_that.gridCols);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CityBlock> blocks,  Map<String, BlockHealthSummary> summaries,  CityHealthStats stats,  int gridRows,  int gridCols)?  $default,) {final _that = this;
switch (_that) {
case _CityHealthSnapshot() when $default != null:
return $default(_that.blocks,_that.summaries,_that.stats,_that.gridRows,_that.gridCols);case _:
  return null;

}
}

}

/// @nodoc


class _CityHealthSnapshot extends CityHealthSnapshot {
  const _CityHealthSnapshot({required  List<CityBlock> blocks, required  Map<String, BlockHealthSummary> summaries, required this.stats, required this.gridRows, required this.gridCols}): _blocks = blocks,_summaries = summaries,super._();
  

 final  List<CityBlock> _blocks;
@override List<CityBlock> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}

 final  Map<String, BlockHealthSummary> _summaries;
@override Map<String, BlockHealthSummary> get summaries {
  if (_summaries is EqualUnmodifiableMapView) return _summaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_summaries);
}

@override final  CityHealthStats stats;
@override final  int gridRows;
@override final  int gridCols;

/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityHealthSnapshotCopyWith<_CityHealthSnapshot> get copyWith => __$CityHealthSnapshotCopyWithImpl<_CityHealthSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityHealthSnapshot&&const DeepCollectionEquality().equals(other.blocks, _blocks)&&const DeepCollectionEquality().equals(other.summaries, _summaries)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.gridRows, gridRows) || other.gridRows == gridRows)&&(identical(other.gridCols, gridCols) || other.gridCols == gridCols));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_blocks),const DeepCollectionEquality().hash(_summaries),stats,gridRows,gridCols);
}

@override
String toString() {
    return 'CityHealthSnapshot(blocks: $blocks, summaries: $summaries, stats: $stats, gridRows: $gridRows, gridCols: $gridCols)';
}


}

/// @nodoc
abstract mixin class _$CityHealthSnapshotCopyWith<$Res> implements $CityHealthSnapshotCopyWith<$Res> {
  factory _$CityHealthSnapshotCopyWith(_CityHealthSnapshot value, $Res Function(_CityHealthSnapshot) _then) = __$CityHealthSnapshotCopyWithImpl;
@override @useResult
$Res call({
 List<CityBlock> blocks, Map<String, BlockHealthSummary> summaries, CityHealthStats stats, int gridRows, int gridCols
});


@override $CityHealthStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$CityHealthSnapshotCopyWithImpl<$Res>
    implements _$CityHealthSnapshotCopyWith<$Res> {
  __$CityHealthSnapshotCopyWithImpl(this._self, this._then);

  final _CityHealthSnapshot _self;
  final $Res Function(_CityHealthSnapshot) _then;

/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blocks = null,Object? summaries = null,Object? stats = null,Object? gridRows = null,Object? gridCols = null,}) {
  return _then(_CityHealthSnapshot(
blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<CityBlock>,summaries: null == summaries ? _self._summaries : summaries // ignore: cast_nullable_to_non_nullable
as Map<String, BlockHealthSummary>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as CityHealthStats,gridRows: null == gridRows ? _self.gridRows : gridRows // ignore: cast_nullable_to_non_nullable
as int,gridCols: null == gridCols ? _self.gridCols : gridCols // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CityHealthSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityHealthStatsCopyWith<$Res> get stats {
  
  return $CityHealthStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
