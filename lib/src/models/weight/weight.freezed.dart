// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weight _$WeightFromJson(Map<String, dynamic> json) {
  return _Weight.fromJson(json);
}

/// @nodoc
mixin _$Weight {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_fat')
  double? get bodyFat => throw _privateConstructorUsedError;
  @JsonKey(name: 'muscle_mass')
  double? get muscleMass => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_photos')
  List<ProgressPhoto>? get progressPhotos => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_photos_small')
  List<ProgressPhoto>? get progressPhotosSmall =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_photos_medium')
  List<ProgressPhoto>? get progressPhotosMedium =>
      throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Weight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Weight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightCopyWith<Weight> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightCopyWith<$Res> {
  factory $WeightCopyWith(Weight value, $Res Function(Weight) then) =
      _$WeightCopyWithImpl<$Res, Weight>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      double weight,
      @JsonKey(name: 'body_fat') double? bodyFat,
      @JsonKey(name: 'muscle_mass') double? muscleMass,
      @JsonKey(name: 'progress_photos') List<ProgressPhoto>? progressPhotos,
      @JsonKey(name: 'progress_photos_small')
      List<ProgressPhoto>? progressPhotosSmall,
      @JsonKey(name: 'progress_photos_medium')
      List<ProgressPhoto>? progressPhotosMedium,
      String? notes,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class _$WeightCopyWithImpl<$Res, $Val extends Weight>
    implements $WeightCopyWith<$Res> {
  _$WeightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weight = null,
    Object? bodyFat = freezed,
    Object? muscleMass = freezed,
    Object? progressPhotos = freezed,
    Object? progressPhotosSmall = freezed,
    Object? progressPhotosMedium = freezed,
    Object? notes = freezed,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyFat: freezed == bodyFat
          ? _value.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      muscleMass: freezed == muscleMass
          ? _value.muscleMass
          : muscleMass // ignore: cast_nullable_to_non_nullable
              as double?,
      progressPhotos: freezed == progressPhotos
          ? _value.progressPhotos
          : progressPhotos // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      progressPhotosSmall: freezed == progressPhotosSmall
          ? _value.progressPhotosSmall
          : progressPhotosSmall // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      progressPhotosMedium: freezed == progressPhotosMedium
          ? _value.progressPhotosMedium
          : progressPhotosMedium // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$WeightImplCopyWith<$Res> implements $WeightCopyWith<$Res> {
  factory _$$WeightImplCopyWith(
          _$WeightImpl value, $Res Function(_$WeightImpl) then) =
      __$$WeightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      double weight,
      @JsonKey(name: 'body_fat') double? bodyFat,
      @JsonKey(name: 'muscle_mass') double? muscleMass,
      @JsonKey(name: 'progress_photos') List<ProgressPhoto>? progressPhotos,
      @JsonKey(name: 'progress_photos_small')
      List<ProgressPhoto>? progressPhotosSmall,
      @JsonKey(name: 'progress_photos_medium')
      List<ProgressPhoto>? progressPhotosMedium,
      String? notes,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class __$$WeightImplCopyWithImpl<$Res>
    extends _$WeightCopyWithImpl<$Res, _$WeightImpl>
    implements _$$WeightImplCopyWith<$Res> {
  __$$WeightImplCopyWithImpl(
      _$WeightImpl _value, $Res Function(_$WeightImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weight = null,
    Object? bodyFat = freezed,
    Object? muscleMass = freezed,
    Object? progressPhotos = freezed,
    Object? progressPhotosSmall = freezed,
    Object? progressPhotosMedium = freezed,
    Object? notes = freezed,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$WeightImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      bodyFat: freezed == bodyFat
          ? _value.bodyFat
          : bodyFat // ignore: cast_nullable_to_non_nullable
              as double?,
      muscleMass: freezed == muscleMass
          ? _value.muscleMass
          : muscleMass // ignore: cast_nullable_to_non_nullable
              as double?,
      progressPhotos: freezed == progressPhotos
          ? _value._progressPhotos
          : progressPhotos // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      progressPhotosSmall: freezed == progressPhotosSmall
          ? _value._progressPhotosSmall
          : progressPhotosSmall // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      progressPhotosMedium: freezed == progressPhotosMedium
          ? _value._progressPhotosMedium
          : progressPhotosMedium // ignore: cast_nullable_to_non_nullable
              as List<ProgressPhoto>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$WeightImpl implements _Weight {
  const _$WeightImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      required this.weight,
      @JsonKey(name: 'body_fat') this.bodyFat,
      @JsonKey(name: 'muscle_mass') this.muscleMass,
      @JsonKey(name: 'progress_photos')
      final List<ProgressPhoto>? progressPhotos,
      @JsonKey(name: 'progress_photos_small')
      final List<ProgressPhoto>? progressPhotosSmall,
      @JsonKey(name: 'progress_photos_medium')
      final List<ProgressPhoto>? progressPhotosMedium,
      this.notes,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required this.recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required this.modifiedAt})
      : _progressPhotos = progressPhotos,
        _progressPhotosSmall = progressPhotosSmall,
        _progressPhotosMedium = progressPhotosMedium;

  factory _$WeightImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  final double weight;
  @override
  @JsonKey(name: 'body_fat')
  final double? bodyFat;
  @override
  @JsonKey(name: 'muscle_mass')
  final double? muscleMass;
  final List<ProgressPhoto>? _progressPhotos;
  @override
  @JsonKey(name: 'progress_photos')
  List<ProgressPhoto>? get progressPhotos {
    final value = _progressPhotos;
    if (value == null) return null;
    if (_progressPhotos is EqualUnmodifiableListView) return _progressPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProgressPhoto>? _progressPhotosSmall;
  @override
  @JsonKey(name: 'progress_photos_small')
  List<ProgressPhoto>? get progressPhotosSmall {
    final value = _progressPhotosSmall;
    if (value == null) return null;
    if (_progressPhotosSmall is EqualUnmodifiableListView)
      return _progressPhotosSmall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProgressPhoto>? _progressPhotosMedium;
  @override
  @JsonKey(name: 'progress_photos_medium')
  List<ProgressPhoto>? get progressPhotosMedium {
    final value = _progressPhotosMedium;
    if (value == null) return null;
    if (_progressPhotosMedium is EqualUnmodifiableListView)
      return _progressPhotosMedium;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;
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
    return 'Weight(id: $id, weight: $weight, bodyFat: $bodyFat, muscleMass: $muscleMass, progressPhotos: $progressPhotos, progressPhotosSmall: $progressPhotosSmall, progressPhotosMedium: $progressPhotosMedium, notes: $notes, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.bodyFat, bodyFat) || other.bodyFat == bodyFat) &&
            (identical(other.muscleMass, muscleMass) ||
                other.muscleMass == muscleMass) &&
            const DeepCollectionEquality()
                .equals(other._progressPhotos, _progressPhotos) &&
            const DeepCollectionEquality()
                .equals(other._progressPhotosSmall, _progressPhotosSmall) &&
            const DeepCollectionEquality()
                .equals(other._progressPhotosMedium, _progressPhotosMedium) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      weight,
      bodyFat,
      muscleMass,
      const DeepCollectionEquality().hash(_progressPhotos),
      const DeepCollectionEquality().hash(_progressPhotosSmall),
      const DeepCollectionEquality().hash(_progressPhotosMedium),
      notes,
      recordedAt,
      modifiedAt);

  /// Create a copy of Weight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightImplCopyWith<_$WeightImpl> get copyWith =>
      __$$WeightImplCopyWithImpl<_$WeightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightImplToJson(
      this,
    );
  }
}

abstract class _Weight implements Weight {
  const factory _Weight(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      required final double weight,
      @JsonKey(name: 'body_fat') final double? bodyFat,
      @JsonKey(name: 'muscle_mass') final double? muscleMass,
      @JsonKey(name: 'progress_photos')
      final List<ProgressPhoto>? progressPhotos,
      @JsonKey(name: 'progress_photos_small')
      final List<ProgressPhoto>? progressPhotosSmall,
      @JsonKey(name: 'progress_photos_medium')
      final List<ProgressPhoto>? progressPhotosMedium,
      final String? notes,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required final DateTime recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required final DateTime modifiedAt}) = _$WeightImpl;

  factory _Weight.fromJson(Map<String, dynamic> json) = _$WeightImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  double get weight;
  @override
  @JsonKey(name: 'body_fat')
  double? get bodyFat;
  @override
  @JsonKey(name: 'muscle_mass')
  double? get muscleMass;
  @override
  @JsonKey(name: 'progress_photos')
  List<ProgressPhoto>? get progressPhotos;
  @override
  @JsonKey(name: 'progress_photos_small')
  List<ProgressPhoto>? get progressPhotosSmall;
  @override
  @JsonKey(name: 'progress_photos_medium')
  List<ProgressPhoto>? get progressPhotosMedium;
  @override
  String? get notes;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;

  /// Create a copy of Weight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightImplCopyWith<_$WeightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
