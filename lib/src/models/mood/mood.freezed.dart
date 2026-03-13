// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mood _$MoodFromJson(Map<String, dynamic> json) {
  return _Mood.fromJson(json);
}

/// @nodoc
mixin _$Mood {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood_level')
  MoodLevel get moodLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood_sentiments')
  Set<MoodSentiment> get moodSentiments => throw _privateConstructorUsedError;
  @JsonKey(name: 'mood_activities')
  Set<MoodActivity> get moodActivities => throw _privateConstructorUsedError;
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

  /// Serializes this Mood to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodCopyWith<Mood> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodCopyWith<$Res> {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) then) =
      _$MoodCopyWithImpl<$Res, Mood>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'mood_level') MoodLevel moodLevel,
      @JsonKey(name: 'mood_sentiments') Set<MoodSentiment> moodSentiments,
      @JsonKey(name: 'mood_activities') Set<MoodActivity> moodActivities,
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
class _$MoodCopyWithImpl<$Res, $Val extends Mood>
    implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? moodLevel = null,
    Object? moodSentiments = null,
    Object? moodActivities = null,
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
      moodLevel: null == moodLevel
          ? _value.moodLevel
          : moodLevel // ignore: cast_nullable_to_non_nullable
              as MoodLevel,
      moodSentiments: null == moodSentiments
          ? _value.moodSentiments
          : moodSentiments // ignore: cast_nullable_to_non_nullable
              as Set<MoodSentiment>,
      moodActivities: null == moodActivities
          ? _value.moodActivities
          : moodActivities // ignore: cast_nullable_to_non_nullable
              as Set<MoodActivity>,
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
abstract class _$$MoodImplCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$$MoodImplCopyWith(
          _$MoodImpl value, $Res Function(_$MoodImpl) then) =
      __$$MoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'mood_level') MoodLevel moodLevel,
      @JsonKey(name: 'mood_sentiments') Set<MoodSentiment> moodSentiments,
      @JsonKey(name: 'mood_activities') Set<MoodActivity> moodActivities,
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
class __$$MoodImplCopyWithImpl<$Res>
    extends _$MoodCopyWithImpl<$Res, _$MoodImpl>
    implements _$$MoodImplCopyWith<$Res> {
  __$$MoodImplCopyWithImpl(_$MoodImpl _value, $Res Function(_$MoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? moodLevel = null,
    Object? moodSentiments = null,
    Object? moodActivities = null,
    Object? progressPhotos = freezed,
    Object? progressPhotosSmall = freezed,
    Object? progressPhotosMedium = freezed,
    Object? notes = freezed,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$MoodImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      moodLevel: null == moodLevel
          ? _value.moodLevel
          : moodLevel // ignore: cast_nullable_to_non_nullable
              as MoodLevel,
      moodSentiments: null == moodSentiments
          ? _value._moodSentiments
          : moodSentiments // ignore: cast_nullable_to_non_nullable
              as Set<MoodSentiment>,
      moodActivities: null == moodActivities
          ? _value._moodActivities
          : moodActivities // ignore: cast_nullable_to_non_nullable
              as Set<MoodActivity>,
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
class _$MoodImpl implements _Mood {
  const _$MoodImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      @JsonKey(name: 'mood_level') this.moodLevel = MoodLevel.normal,
      @JsonKey(name: 'mood_sentiments')
      final Set<MoodSentiment> moodSentiments = const {},
      @JsonKey(name: 'mood_activities')
      final Set<MoodActivity> moodActivities = const {},
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
      : _moodSentiments = moodSentiments,
        _moodActivities = moodActivities,
        _progressPhotos = progressPhotos,
        _progressPhotosSmall = progressPhotosSmall,
        _progressPhotosMedium = progressPhotosMedium;

  factory _$MoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'mood_level')
  final MoodLevel moodLevel;
  final Set<MoodSentiment> _moodSentiments;
  @override
  @JsonKey(name: 'mood_sentiments')
  Set<MoodSentiment> get moodSentiments {
    if (_moodSentiments is EqualUnmodifiableSetView) return _moodSentiments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_moodSentiments);
  }

  final Set<MoodActivity> _moodActivities;
  @override
  @JsonKey(name: 'mood_activities')
  Set<MoodActivity> get moodActivities {
    if (_moodActivities is EqualUnmodifiableSetView) return _moodActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_moodActivities);
  }

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
    return 'Mood(id: $id, moodLevel: $moodLevel, moodSentiments: $moodSentiments, moodActivities: $moodActivities, progressPhotos: $progressPhotos, progressPhotosSmall: $progressPhotosSmall, progressPhotosMedium: $progressPhotosMedium, notes: $notes, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moodLevel, moodLevel) ||
                other.moodLevel == moodLevel) &&
            const DeepCollectionEquality()
                .equals(other._moodSentiments, _moodSentiments) &&
            const DeepCollectionEquality()
                .equals(other._moodActivities, _moodActivities) &&
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
      moodLevel,
      const DeepCollectionEquality().hash(_moodSentiments),
      const DeepCollectionEquality().hash(_moodActivities),
      const DeepCollectionEquality().hash(_progressPhotos),
      const DeepCollectionEquality().hash(_progressPhotosSmall),
      const DeepCollectionEquality().hash(_progressPhotosMedium),
      notes,
      recordedAt,
      modifiedAt);

  /// Create a copy of Mood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodImplCopyWith<_$MoodImpl> get copyWith =>
      __$$MoodImplCopyWithImpl<_$MoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodImplToJson(
      this,
    );
  }
}

abstract class _Mood implements Mood {
  const factory _Mood(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      @JsonKey(name: 'mood_level') final MoodLevel moodLevel,
      @JsonKey(name: 'mood_sentiments') final Set<MoodSentiment> moodSentiments,
      @JsonKey(name: 'mood_activities') final Set<MoodActivity> moodActivities,
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
      required final DateTime modifiedAt}) = _$MoodImpl;

  factory _Mood.fromJson(Map<String, dynamic> json) = _$MoodImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'mood_level')
  MoodLevel get moodLevel;
  @override
  @JsonKey(name: 'mood_sentiments')
  Set<MoodSentiment> get moodSentiments;
  @override
  @JsonKey(name: 'mood_activities')
  Set<MoodActivity> get moodActivities;
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

  /// Create a copy of Mood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodImplCopyWith<_$MoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
