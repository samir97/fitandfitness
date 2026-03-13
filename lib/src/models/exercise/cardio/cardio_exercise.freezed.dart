// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardioExercise _$CardioExerciseFromJson(Map<String, dynamic> json) {
  return _CardioExercise.fromJson(json);
}

/// @nodoc
mixin _$CardioExercise {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'cardio_activity')
  CardioActivity? get cardioActivity => throw _privateConstructorUsedError;
  double? get met => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_preset')
  bool get isPreset => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this CardioExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardioExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardioExerciseCopyWith<CardioExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardioExerciseCopyWith<$Res> {
  factory $CardioExerciseCopyWith(
          CardioExercise value, $Res Function(CardioExercise) then) =
      _$CardioExerciseCopyWithImpl<$Res, CardioExercise>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'cardio_activity') CardioActivity? cardioActivity,
      double? met,
      @JsonKey(name: 'is_preset') bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      DateTime? recordedAt});
}

/// @nodoc
class _$CardioExerciseCopyWithImpl<$Res, $Val extends CardioExercise>
    implements $CardioExerciseCopyWith<$Res> {
  _$CardioExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardioExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cardioActivity = freezed,
    Object? met = freezed,
    Object? isPreset = null,
    Object? recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardioActivity: freezed == cardioActivity
          ? _value.cardioActivity
          : cardioActivity // ignore: cast_nullable_to_non_nullable
              as CardioActivity?,
      met: freezed == met
          ? _value.met
          : met // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$CardioExerciseImplCopyWith<$Res>
    implements $CardioExerciseCopyWith<$Res> {
  factory _$$CardioExerciseImplCopyWith(_$CardioExerciseImpl value,
          $Res Function(_$CardioExerciseImpl) then) =
      __$$CardioExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'cardio_activity') CardioActivity? cardioActivity,
      double? met,
      @JsonKey(name: 'is_preset') bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      DateTime? recordedAt});
}

/// @nodoc
class __$$CardioExerciseImplCopyWithImpl<$Res>
    extends _$CardioExerciseCopyWithImpl<$Res, _$CardioExerciseImpl>
    implements _$$CardioExerciseImplCopyWith<$Res> {
  __$$CardioExerciseImplCopyWithImpl(
      _$CardioExerciseImpl _value, $Res Function(_$CardioExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardioExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cardioActivity = freezed,
    Object? met = freezed,
    Object? isPreset = null,
    Object? recordedAt = freezed,
  }) {
    return _then(_$CardioExerciseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardioActivity: freezed == cardioActivity
          ? _value.cardioActivity
          : cardioActivity // ignore: cast_nullable_to_non_nullable
              as CardioActivity?,
      met: freezed == met
          ? _value.met
          : met // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$CardioExerciseImpl implements _CardioExercise {
  const _$CardioExerciseImpl(
      {required this.name,
      @JsonKey(name: 'cardio_activity') this.cardioActivity,
      this.met,
      @JsonKey(name: 'is_preset') this.isPreset = false,
      @TimestampConverter() @JsonKey(name: 'recorded_at') this.recordedAt});

  factory _$CardioExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardioExerciseImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'cardio_activity')
  final CardioActivity? cardioActivity;
  @override
  final double? met;
  @override
  @JsonKey(name: 'is_preset')
  final bool isPreset;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  final DateTime? recordedAt;

  @override
  String toString() {
    return 'CardioExercise(name: $name, cardioActivity: $cardioActivity, met: $met, isPreset: $isPreset, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardioExerciseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cardioActivity, cardioActivity) ||
                other.cardioActivity == cardioActivity) &&
            (identical(other.met, met) || other.met == met) &&
            (identical(other.isPreset, isPreset) ||
                other.isPreset == isPreset) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, cardioActivity, met, isPreset, recordedAt);

  /// Create a copy of CardioExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardioExerciseImplCopyWith<_$CardioExerciseImpl> get copyWith =>
      __$$CardioExerciseImplCopyWithImpl<_$CardioExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardioExerciseImplToJson(
      this,
    );
  }
}

abstract class _CardioExercise implements CardioExercise {
  const factory _CardioExercise(
      {required final String name,
      @JsonKey(name: 'cardio_activity') final CardioActivity? cardioActivity,
      final double? met,
      @JsonKey(name: 'is_preset') final bool isPreset,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      final DateTime? recordedAt}) = _$CardioExerciseImpl;

  factory _CardioExercise.fromJson(Map<String, dynamic> json) =
      _$CardioExerciseImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'cardio_activity')
  CardioActivity? get cardioActivity;
  @override
  double? get met;
  @override
  @JsonKey(name: 'is_preset')
  bool get isPreset;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime? get recordedAt;

  /// Create a copy of CardioExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardioExerciseImplCopyWith<_$CardioExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
