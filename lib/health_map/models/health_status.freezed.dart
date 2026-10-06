// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
HealthStatus _$HealthStatusFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'healthy':
          return HealthyStatus.fromJson(
            json
          );
                case 'suspected':
          return SuspectedStatus.fromJson(
            json
          );
                case 'infected':
          return InfectedStatus.fromJson(
            json
          );
                case 'recovered':
          return RecoveredStatus.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'HealthStatus',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$HealthStatus {



  /// Serializes this HealthStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthStatus);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HealthStatus()';
}


}

/// @nodoc
class $HealthStatusCopyWith<$Res>  {
$HealthStatusCopyWith(HealthStatus _, $Res Function(HealthStatus) __);
}


/// Adds pattern-matching-related methods to [HealthStatus].
extension HealthStatusPatterns on HealthStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HealthyStatus value)?  healthy,TResult Function( SuspectedStatus value)?  suspected,TResult Function( InfectedStatus value)?  infected,TResult Function( RecoveredStatus value)?  recovered,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HealthyStatus() when healthy != null:
return healthy(_that);case SuspectedStatus() when suspected != null:
return suspected(_that);case InfectedStatus() when infected != null:
return infected(_that);case RecoveredStatus() when recovered != null:
return recovered(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HealthyStatus value)  healthy,required TResult Function( SuspectedStatus value)  suspected,required TResult Function( InfectedStatus value)  infected,required TResult Function( RecoveredStatus value)  recovered,}){
final _that = this;
switch (_that) {
case HealthyStatus():
return healthy(_that);case SuspectedStatus():
return suspected(_that);case InfectedStatus():
return infected(_that);case RecoveredStatus():
return recovered(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HealthyStatus value)?  healthy,TResult? Function( SuspectedStatus value)?  suspected,TResult? Function( InfectedStatus value)?  infected,TResult? Function( RecoveredStatus value)?  recovered,}){
final _that = this;
switch (_that) {
case HealthyStatus() when healthy != null:
return healthy(_that);case SuspectedStatus() when suspected != null:
return suspected(_that);case InfectedStatus() when infected != null:
return infected(_that);case RecoveredStatus() when recovered != null:
return recovered(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  healthy,TResult Function( DateTime reportedAt)?  suspected,TResult Function( DateTime confirmedAt,  InfectionSeverity severity)?  infected,TResult Function( DateTime recoveredAt)?  recovered,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HealthyStatus() when healthy != null:
return healthy();case SuspectedStatus() when suspected != null:
return suspected(_that.reportedAt);case InfectedStatus() when infected != null:
return infected(_that.confirmedAt,_that.severity);case RecoveredStatus() when recovered != null:
return recovered(_that.recoveredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  healthy,required TResult Function( DateTime reportedAt)  suspected,required TResult Function( DateTime confirmedAt,  InfectionSeverity severity)  infected,required TResult Function( DateTime recoveredAt)  recovered,}) {final _that = this;
switch (_that) {
case HealthyStatus():
return healthy();case SuspectedStatus():
return suspected(_that.reportedAt);case InfectedStatus():
return infected(_that.confirmedAt,_that.severity);case RecoveredStatus():
return recovered(_that.recoveredAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  healthy,TResult? Function( DateTime reportedAt)?  suspected,TResult? Function( DateTime confirmedAt,  InfectionSeverity severity)?  infected,TResult? Function( DateTime recoveredAt)?  recovered,}) {final _that = this;
switch (_that) {
case HealthyStatus() when healthy != null:
return healthy();case SuspectedStatus() when suspected != null:
return suspected(_that.reportedAt);case InfectedStatus() when infected != null:
return infected(_that.confirmedAt,_that.severity);case RecoveredStatus() when recovered != null:
return recovered(_that.recoveredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class HealthyStatus extends HealthStatus {
  const HealthyStatus({ String? $type}): $type = $type ?? 'healthy',super._();
  factory HealthyStatus.fromJson(Map<String, dynamic> json) => _$HealthyStatusFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$HealthyStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthyStatus);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HealthStatus.healthy()';
}


}




/// @nodoc
@JsonSerializable()

class SuspectedStatus extends HealthStatus {
  const SuspectedStatus({required this.reportedAt,  String? $type}): $type = $type ?? 'suspected',super._();
  factory SuspectedStatus.fromJson(Map<String, dynamic> json) => _$SuspectedStatusFromJson(json);

 final  DateTime reportedAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuspectedStatusCopyWith<SuspectedStatus> get copyWith => _$SuspectedStatusCopyWithImpl<SuspectedStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuspectedStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SuspectedStatus&&(identical(other.reportedAt, reportedAt) || other.reportedAt == reportedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reportedAt);
}

@override
String toString() {
    return 'HealthStatus.suspected(reportedAt: $reportedAt)';
}


}

/// @nodoc
abstract mixin class $SuspectedStatusCopyWith<$Res> implements $HealthStatusCopyWith<$Res> {
  factory $SuspectedStatusCopyWith(SuspectedStatus value, $Res Function(SuspectedStatus) _then) = _$SuspectedStatusCopyWithImpl;
@useResult
$Res call({
 DateTime reportedAt
});




}
/// @nodoc
class _$SuspectedStatusCopyWithImpl<$Res>
    implements $SuspectedStatusCopyWith<$Res> {
  _$SuspectedStatusCopyWithImpl(this._self, this._then);

  final SuspectedStatus _self;
  final $Res Function(SuspectedStatus) _then;

/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportedAt = null,}) {
  return _then(SuspectedStatus(
reportedAt: null == reportedAt ? _self.reportedAt : reportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InfectedStatus extends HealthStatus {
  const InfectedStatus({required this.confirmedAt, this.severity = InfectionSeverity.mild,  String? $type}): $type = $type ?? 'infected',super._();
  factory InfectedStatus.fromJson(Map<String, dynamic> json) => _$InfectedStatusFromJson(json);

 final  DateTime confirmedAt;
@JsonKey() final  InfectionSeverity severity;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfectedStatusCopyWith<InfectedStatus> get copyWith => _$InfectedStatusCopyWithImpl<InfectedStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfectedStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InfectedStatus&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.severity, severity) || other.severity == severity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,confirmedAt,severity);
}

@override
String toString() {
    return 'HealthStatus.infected(confirmedAt: $confirmedAt, severity: $severity)';
}


}

/// @nodoc
abstract mixin class $InfectedStatusCopyWith<$Res> implements $HealthStatusCopyWith<$Res> {
  factory $InfectedStatusCopyWith(InfectedStatus value, $Res Function(InfectedStatus) _then) = _$InfectedStatusCopyWithImpl;
@useResult
$Res call({
 DateTime confirmedAt, InfectionSeverity severity
});




}
/// @nodoc
class _$InfectedStatusCopyWithImpl<$Res>
    implements $InfectedStatusCopyWith<$Res> {
  _$InfectedStatusCopyWithImpl(this._self, this._then);

  final InfectedStatus _self;
  final $Res Function(InfectedStatus) _then;

/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmedAt = null,Object? severity = null,}) {
  return _then(InfectedStatus(
confirmedAt: null == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as InfectionSeverity,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RecoveredStatus extends HealthStatus {
  const RecoveredStatus({required this.recoveredAt,  String? $type}): $type = $type ?? 'recovered',super._();
  factory RecoveredStatus.fromJson(Map<String, dynamic> json) => _$RecoveredStatusFromJson(json);

 final  DateTime recoveredAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveredStatusCopyWith<RecoveredStatus> get copyWith => _$RecoveredStatusCopyWithImpl<RecoveredStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecoveredStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveredStatus&&(identical(other.recoveredAt, recoveredAt) || other.recoveredAt == recoveredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,recoveredAt);
}

@override
String toString() {
    return 'HealthStatus.recovered(recoveredAt: $recoveredAt)';
}


}

/// @nodoc
abstract mixin class $RecoveredStatusCopyWith<$Res> implements $HealthStatusCopyWith<$Res> {
  factory $RecoveredStatusCopyWith(RecoveredStatus value, $Res Function(RecoveredStatus) _then) = _$RecoveredStatusCopyWithImpl;
@useResult
$Res call({
 DateTime recoveredAt
});




}
/// @nodoc
class _$RecoveredStatusCopyWithImpl<$Res>
    implements $RecoveredStatusCopyWith<$Res> {
  _$RecoveredStatusCopyWithImpl(this._self, this._then);

  final RecoveredStatus _self;
  final $Res Function(RecoveredStatus) _then;

/// Create a copy of HealthStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recoveredAt = null,}) {
  return _then(RecoveredStatus(
recoveredAt: null == recoveredAt ? _self.recoveredAt : recoveredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
