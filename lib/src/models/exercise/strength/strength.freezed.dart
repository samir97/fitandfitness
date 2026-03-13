// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strength.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Strength _$StrengthFromJson(Map<String, dynamic> json) {
  return _Strength.fromJson(json);
}

/// @nodoc
mixin _$Strength {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  StrengthExercise get exercise => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_sets')
  int get numberOfSets => throw _privateConstructorUsedError;
  @JsonKey(name: 'repetitions_per_set')
  int get repetitionsPerSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_per_set')
  double? get weightPerSet => throw _privateConstructorUsedError;
  Cardio? get cardio => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Strength to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrengthCopyWith<Strength> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrengthCopyWith<$Res> {
  factory $StrengthCopyWith(Strength value, $Res Function(Strength) then) =
      _$StrengthCopyWithImpl<$Res, Strength>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      StrengthExercise exercise,
      @JsonKey(name: 'number_of_sets') int numberOfSets,
      @JsonKey(name: 'repetitions_per_set') int repetitionsPerSet,
      @JsonKey(name: 'weight_per_set') double? weightPerSet,
      Cardio? cardio,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});

  $StrengthExerciseCopyWith<$Res> get exercise;
  $CardioCopyWith<$Res>? get cardio;
}

/// @nodoc
class _$StrengthCopyWithImpl<$Res, $Val extends Strength>
    implements $StrengthCopyWith<$Res> {
  _$StrengthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exercise = null,
    Object? numberOfSets = null,
    Object? repetitionsPerSet = null,
    Object? weightPerSet = freezed,
    Object? cardio = freezed,
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
              as StrengthExercise,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      repetitionsPerSet: null == repetitionsPerSet
          ? _value.repetitionsPerSet
          : repetitionsPerSet // ignore: cast_nullable_to_non_nullable
              as int,
      weightPerSet: freezed == weightPerSet
          ? _value.weightPerSet
          : weightPerSet // ignore: cast_nullable_to_non_nullable
              as double?,
      cardio: freezed == cardio
          ? _value.cardio
          : cardio // ignore: cast_nullable_to_non_nullable
              as Cardio?,
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

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrengthExerciseCopyWith<$Res> get exercise {
    return $StrengthExerciseCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardioCopyWith<$Res>? get cardio {
    if (_value.cardio == null) {
      return null;
    }

    return $CardioCopyWith<$Res>(_value.cardio!, (value) {
      return _then(_value.copyWith(cardio: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StrengthImplCopyWith<$Res>
    implements $StrengthCopyWith<$Res> {
  factory _$$StrengthImplCopyWith(
          _$StrengthImpl value, $Res Function(_$StrengthImpl) then) =
      __$$StrengthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      StrengthExercise exercise,
      @JsonKey(name: 'number_of_sets') int numberOfSets,
      @JsonKey(name: 'repetitions_per_set') int repetitionsPerSet,
      @JsonKey(name: 'weight_per_set') double? weightPerSet,
      Cardio? cardio,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});

  @override
  $StrengthExerciseCopyWith<$Res> get exercise;
  @override
  $CardioCopyWith<$Res>? get cardio;
}

/// @nodoc
class __$$StrengthImplCopyWithImpl<$Res>
    extends _$StrengthCopyWithImpl<$Res, _$StrengthImpl>
    implements _$$StrengthImplCopyWith<$Res> {
  __$$StrengthImplCopyWithImpl(
      _$StrengthImpl _value, $Res Function(_$StrengthImpl) _then)
      : super(_value, _then);

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exercise = null,
    Object? numberOfSets = null,
    Object? repetitionsPerSet = null,
    Object? weightPerSet = freezed,
    Object? cardio = freezed,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$StrengthImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as StrengthExercise,
      numberOfSets: null == numberOfSets
          ? _value.numberOfSets
          : numberOfSets // ignore: cast_nullable_to_non_nullable
              as int,
      repetitionsPerSet: null == repetitionsPerSet
          ? _value.repetitionsPerSet
          : repetitionsPerSet // ignore: cast_nullable_to_non_nullable
              as int,
      weightPerSet: freezed == weightPerSet
          ? _value.weightPerSet
          : weightPerSet // ignore: cast_nullable_to_non_nullable
              as double?,
      cardio: freezed == cardio
          ? _value.cardio
          : cardio // ignore: cast_nullable_to_non_nullable
              as Cardio?,
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
class _$StrengthImpl extends _Strength {
  const _$StrengthImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      required this.exercise,
      @JsonKey(name: 'number_of_sets') required this.numberOfSets,
      @JsonKey(name: 'repetitions_per_set') required this.repetitionsPerSet,
      @JsonKey(name: 'weight_per_set') this.weightPerSet,
      this.cardio,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required this.recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required this.modifiedAt})
      : super._();

  factory _$StrengthImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrengthImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  final StrengthExercise exercise;
  @override
  @JsonKey(name: 'number_of_sets')
  final int numberOfSets;
  @override
  @JsonKey(name: 'repetitions_per_set')
  final int repetitionsPerSet;
  @override
  @JsonKey(name: 'weight_per_set')
  final double? weightPerSet;
  @override
  final Cardio? cardio;
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
    return 'Strength(id: $id, exercise: $exercise, numberOfSets: $numberOfSets, repetitionsPerSet: $repetitionsPerSet, weightPerSet: $weightPerSet, cardio: $cardio, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrengthImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.numberOfSets, numberOfSets) ||
                other.numberOfSets == numberOfSets) &&
            (identical(other.repetitionsPerSet, repetitionsPerSet) ||
                other.repetitionsPerSet == repetitionsPerSet) &&
            (identical(other.weightPerSet, weightPerSet) ||
                other.weightPerSet == weightPerSet) &&
            (identical(other.cardio, cardio) || other.cardio == cardio) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, exercise, numberOfSets,
      repetitionsPerSet, weightPerSet, cardio, recordedAt, modifiedAt);

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrengthImplCopyWith<_$StrengthImpl> get copyWith =>
      __$$StrengthImplCopyWithImpl<_$StrengthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrengthImplToJson(
      this,
    );
  }
}

abstract class _Strength extends Strength {
  const factory _Strength(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      required final StrengthExercise exercise,
      @JsonKey(name: 'number_of_sets') required final int numberOfSets,
      @JsonKey(name: 'repetitions_per_set')
      required final int repetitionsPerSet,
      @JsonKey(name: 'weight_per_set') final double? weightPerSet,
      final Cardio? cardio,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required final DateTime recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required final DateTime modifiedAt}) = _$StrengthImpl;
  const _Strength._() : super._();

  factory _Strength.fromJson(Map<String, dynamic> json) =
      _$StrengthImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  StrengthExercise get exercise;
  @override
  @JsonKey(name: 'number_of_sets')
  int get numberOfSets;
  @override
  @JsonKey(name: 'repetitions_per_set')
  int get repetitionsPerSet;
  @override
  @JsonKey(name: 'weight_per_set')
  double? get weightPerSet;
  @override
  Cardio? get cardio;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;

  /// Create a copy of Strength
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrengthImplCopyWith<_$StrengthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
