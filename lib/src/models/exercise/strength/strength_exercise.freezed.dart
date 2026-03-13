// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strength_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StrengthExercise _$StrengthExerciseFromJson(Map<String, dynamic> json) {
  return _StrengthExercise.fromJson(json);
}

/// @nodoc
mixin _$StrengthExercise {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'muscle_groups')
  List<MuscleGroup>? get muscleGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_level')
  ExperienceLevel? get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'motion_type')
  MotionType? get motionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_preset')
  bool get isPreset => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this StrengthExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrengthExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrengthExerciseCopyWith<StrengthExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrengthExerciseCopyWith<$Res> {
  factory $StrengthExerciseCopyWith(
          StrengthExercise value, $Res Function(StrengthExercise) then) =
      _$StrengthExerciseCopyWithImpl<$Res, StrengthExercise>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'muscle_groups') List<MuscleGroup>? muscleGroups,
      @JsonKey(name: 'experience_level') ExperienceLevel? experienceLevel,
      @JsonKey(name: 'motion_type') MotionType? motionType,
      @JsonKey(name: 'is_preset') bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      DateTime? recordedAt});
}

/// @nodoc
class _$StrengthExerciseCopyWithImpl<$Res, $Val extends StrengthExercise>
    implements $StrengthExerciseCopyWith<$Res> {
  _$StrengthExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrengthExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? muscleGroups = freezed,
    Object? experienceLevel = freezed,
    Object? motionType = freezed,
    Object? isPreset = null,
    Object? recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroups: freezed == muscleGroups
          ? _value.muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel?,
      motionType: freezed == motionType
          ? _value.motionType
          : motionType // ignore: cast_nullable_to_non_nullable
              as MotionType?,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
              as bool,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrengthExerciseImplCopyWith<$Res>
    implements $StrengthExerciseCopyWith<$Res> {
  factory _$$StrengthExerciseImplCopyWith(_$StrengthExerciseImpl value,
          $Res Function(_$StrengthExerciseImpl) then) =
      __$$StrengthExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'muscle_groups') List<MuscleGroup>? muscleGroups,
      @JsonKey(name: 'experience_level') ExperienceLevel? experienceLevel,
      @JsonKey(name: 'motion_type') MotionType? motionType,
      @JsonKey(name: 'is_preset') bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      DateTime? recordedAt});
}

/// @nodoc
class __$$StrengthExerciseImplCopyWithImpl<$Res>
    extends _$StrengthExerciseCopyWithImpl<$Res, _$StrengthExerciseImpl>
    implements _$$StrengthExerciseImplCopyWith<$Res> {
  __$$StrengthExerciseImplCopyWithImpl(_$StrengthExerciseImpl _value,
      $Res Function(_$StrengthExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrengthExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? muscleGroups = freezed,
    Object? experienceLevel = freezed,
    Object? motionType = freezed,
    Object? isPreset = null,
    Object? recordedAt = freezed,
  }) {
    return _then(_$StrengthExerciseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroups: freezed == muscleGroups
          ? _value._muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<MuscleGroup>?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel?,
      motionType: freezed == motionType
          ? _value.motionType
          : motionType // ignore: cast_nullable_to_non_nullable
              as MotionType?,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
              as bool,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrengthExerciseImpl implements _StrengthExercise {
  const _$StrengthExerciseImpl(
      {required this.name,
      @JsonKey(name: 'muscle_groups') final List<MuscleGroup>? muscleGroups,
      @JsonKey(name: 'experience_level') this.experienceLevel,
      @JsonKey(name: 'motion_type') this.motionType,
      @JsonKey(name: 'is_preset') this.isPreset = false,
      @TimestampConverter() @JsonKey(name: 'recorded_at') this.recordedAt})
      : _muscleGroups = muscleGroups;

  factory _$StrengthExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrengthExerciseImplFromJson(json);

  @override
  final String name;
  final List<MuscleGroup>? _muscleGroups;
  @override
  @JsonKey(name: 'muscle_groups')
  List<MuscleGroup>? get muscleGroups {
    final value = _muscleGroups;
    if (value == null) return null;
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'experience_level')
  final ExperienceLevel? experienceLevel;
  @override
  @JsonKey(name: 'motion_type')
  final MotionType? motionType;
  @override
  @JsonKey(name: 'is_preset')
  final bool isPreset;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  final DateTime? recordedAt;

  @override
  String toString() {
    return 'StrengthExercise(name: $name, muscleGroups: $muscleGroups, experienceLevel: $experienceLevel, motionType: $motionType, isPreset: $isPreset, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrengthExerciseImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroups, _muscleGroups) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.motionType, motionType) ||
                other.motionType == motionType) &&
            (identical(other.isPreset, isPreset) ||
                other.isPreset == isPreset) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_muscleGroups),
      experienceLevel,
      motionType,
      isPreset,
      recordedAt);

  /// Create a copy of StrengthExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrengthExerciseImplCopyWith<_$StrengthExerciseImpl> get copyWith =>
      __$$StrengthExerciseImplCopyWithImpl<_$StrengthExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrengthExerciseImplToJson(
      this,
    );
  }
}

abstract class _StrengthExercise implements StrengthExercise {
  const factory _StrengthExercise(
      {required final String name,
      @JsonKey(name: 'muscle_groups') final List<MuscleGroup>? muscleGroups,
      @JsonKey(name: 'experience_level') final ExperienceLevel? experienceLevel,
      @JsonKey(name: 'motion_type') final MotionType? motionType,
      @JsonKey(name: 'is_preset') final bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      final DateTime? recordedAt}) = _$StrengthExerciseImpl;

  factory _StrengthExercise.fromJson(Map<String, dynamic> json) =
      _$StrengthExerciseImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'muscle_groups')
  List<MuscleGroup>? get muscleGroups;
  @override
  @JsonKey(name: 'experience_level')
  ExperienceLevel? get experienceLevel;
  @override
  @JsonKey(name: 'motion_type')
  MotionType? get motionType;
  @override
  @JsonKey(name: 'is_preset')
  bool get isPreset;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt;

  /// Create a copy of StrengthExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrengthExerciseImplCopyWith<_$StrengthExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
