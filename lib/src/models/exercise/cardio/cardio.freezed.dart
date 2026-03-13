// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cardio _$CardioFromJson(Map<String, dynamic> json) {
  return _Cardio.fromJson(json);
}

/// @nodoc
mixin _$Cardio {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  CardioExercise get exercise => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutes_performed')
  int get minutesPerformed => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories_burned')
  double get caloriesBurned => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Cardio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardioCopyWith<Cardio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardioCopyWith<$Res> {
  factory $CardioCopyWith(Cardio value, $Res Function(Cardio) then) =
      _$CardioCopyWithImpl<$Res, Cardio>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      CardioExercise exercise,
      @JsonKey(name: 'minutes_performed') int minutesPerformed,
      @JsonKey(name: 'calories_burned') double caloriesBurned,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});

  $CardioExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class _$CardioCopyWithImpl<$Res, $Val extends Cardio>
    implements $CardioCopyWith<$Res> {
  _$CardioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exercise = null,
    Object? minutesPerformed = null,
    Object? caloriesBurned = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as CardioExercise,
      minutesPerformed: null == minutesPerformed
          ? _value.minutesPerformed
          : minutesPerformed // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as double,
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

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardioExerciseCopyWith<$Res> get exercise {
    return $CardioExerciseCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardioImplCopyWith<$Res> implements $CardioCopyWith<$Res> {
  factory _$$CardioImplCopyWith(
          _$CardioImpl value, $Res Function(_$CardioImpl) then) =
      __$$CardioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      CardioExercise exercise,
      @JsonKey(name: 'minutes_performed') int minutesPerformed,
      @JsonKey(name: 'calories_burned') double caloriesBurned,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});

  @override
  $CardioExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$CardioImplCopyWithImpl<$Res>
    extends _$CardioCopyWithImpl<$Res, _$CardioImpl>
    implements _$$CardioImplCopyWith<$Res> {
  __$$CardioImplCopyWithImpl(
      _$CardioImpl _value, $Res Function(_$CardioImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exercise = null,
    Object? minutesPerformed = null,
    Object? caloriesBurned = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$CardioImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as CardioExercise,
      minutesPerformed: null == minutesPerformed
          ? _value.minutesPerformed
          : minutesPerformed // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesBurned: null == caloriesBurned
          ? _value.caloriesBurned
          : caloriesBurned // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$CardioImpl extends _Cardio {
  const _$CardioImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      required this.exercise,
      @JsonKey(name: 'minutes_performed') required this.minutesPerformed,
      @JsonKey(name: 'calories_burned') required this.caloriesBurned,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required this.recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required this.modifiedAt})
      : super._();

  factory _$CardioImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardioImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  final CardioExercise exercise;
  @override
  @JsonKey(name: 'minutes_performed')
  final int minutesPerformed;
  @override
  @JsonKey(name: 'calories_burned')
  final double caloriesBurned;
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
    return 'Cardio(id: $id, exercise: $exercise, minutesPerformed: $minutesPerformed, caloriesBurned: $caloriesBurned, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.minutesPerformed, minutesPerformed) ||
                other.minutesPerformed == minutesPerformed) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, exercise, minutesPerformed,
      caloriesBurned, recordedAt, modifiedAt);

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardioImplCopyWith<_$CardioImpl> get copyWith =>
      __$$CardioImplCopyWithImpl<_$CardioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardioImplToJson(
      this,
    );
  }
}

abstract class _Cardio extends Cardio {
  const factory _Cardio(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      required final CardioExercise exercise,
      @JsonKey(name: 'minutes_performed') required final int minutesPerformed,
      @JsonKey(name: 'calories_burned') required final double caloriesBurned,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required final DateTime recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required final DateTime modifiedAt}) = _$CardioImpl;
  const _Cardio._() : super._();

  factory _Cardio.fromJson(Map<String, dynamic> json) = _$CardioImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  CardioExercise get exercise;
  @override
  @JsonKey(name: 'minutes_performed')
  int get minutesPerformed;
  @override
  @JsonKey(name: 'calories_burned')
  double get caloriesBurned;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;

  /// Create a copy of Cardio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardioImplCopyWith<_$CardioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
