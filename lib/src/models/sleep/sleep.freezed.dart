// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sleep _$SleepFromJson(Map<String, dynamic> json) {
  return _Sleep.fromJson(json);
}

/// @nodoc
mixin _$Sleep {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sleep_quality')
  SleepQuality get sleepQuality => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'slept_at')
  DateTime get sleptAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Sleep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sleep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepCopyWith<Sleep> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepCopyWith<$Res> {
  factory $SleepCopyWith(Sleep value, $Res Function(Sleep) then) =
      _$SleepCopyWithImpl<$Res, Sleep>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'sleep_quality') SleepQuality sleepQuality,
      String? notes,
      @TimestampConverter() @JsonKey(name: 'slept_at') DateTime sleptAt,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class _$SleepCopyWithImpl<$Res, $Val extends Sleep>
    implements $SleepCopyWith<$Res> {
  _$SleepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sleep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sleepQuality = null,
    Object? notes = freezed,
    Object? sleptAt = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sleepQuality: null == sleepQuality
          ? _value.sleepQuality
          : sleepQuality // ignore: cast_nullable_to_non_nullable
              as SleepQuality,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sleptAt: null == sleptAt
          ? _value.sleptAt
          : sleptAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepImplCopyWith<$Res> implements $SleepCopyWith<$Res> {
  factory _$$SleepImplCopyWith(
          _$SleepImpl value, $Res Function(_$SleepImpl) then) =
      __$$SleepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'sleep_quality') SleepQuality sleepQuality,
      String? notes,
      @TimestampConverter() @JsonKey(name: 'slept_at') DateTime sleptAt,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class __$$SleepImplCopyWithImpl<$Res>
    extends _$SleepCopyWithImpl<$Res, _$SleepImpl>
    implements _$$SleepImplCopyWith<$Res> {
  __$$SleepImplCopyWithImpl(
      _$SleepImpl _value, $Res Function(_$SleepImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sleep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sleepQuality = null,
    Object? notes = freezed,
    Object? sleptAt = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$SleepImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sleepQuality: null == sleepQuality
          ? _value.sleepQuality
          : sleepQuality // ignore: cast_nullable_to_non_nullable
              as SleepQuality,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sleptAt: null == sleptAt
          ? _value.sleptAt
          : sleptAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SleepImpl implements _Sleep {
  const _$SleepImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      @JsonKey(name: 'sleep_quality') required this.sleepQuality,
      this.notes,
      @TimestampConverter() @JsonKey(name: 'slept_at') required this.sleptAt,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required this.recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required this.modifiedAt});

  factory _$SleepImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'sleep_quality')
  final SleepQuality sleepQuality;
  @override
  final String? notes;
  @override
  @TimestampConverter()
  @JsonKey(name: 'slept_at')
  final DateTime sleptAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  final DateTime recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;

  @override
  String toString() {
    return 'Sleep(id: $id, sleepQuality: $sleepQuality, notes: $notes, sleptAt: $sleptAt, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.sleptAt, sleptAt) || other.sleptAt == sleptAt) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sleepQuality, notes, sleptAt, recordedAt, modifiedAt);

  /// Create a copy of Sleep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepImplCopyWith<_$SleepImpl> get copyWith =>
      __$$SleepImplCopyWithImpl<_$SleepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepImplToJson(
      this,
    );
  }
}

abstract class _Sleep implements Sleep {
  const factory _Sleep(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      @JsonKey(name: 'sleep_quality') required final SleepQuality sleepQuality,
      final String? notes,
      @TimestampConverter()
      @JsonKey(name: 'slept_at')
      required final DateTime sleptAt,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required final DateTime recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required final DateTime modifiedAt}) = _$SleepImpl;

  factory _Sleep.fromJson(Map<String, dynamic> json) = _$SleepImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'sleep_quality')
  SleepQuality get sleepQuality;
  @override
  String? get notes;
  @override
  @TimestampConverter()
  @JsonKey(name: 'slept_at')
  DateTime get sleptAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;

  /// Create a copy of Sleep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepImplCopyWith<_$SleepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
