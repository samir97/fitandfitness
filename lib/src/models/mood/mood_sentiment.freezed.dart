// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_sentiment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoodSentiment _$MoodSentimentFromJson(Map<String, dynamic> json) {
  return _MoodSentiment.fromJson(json);
}

/// @nodoc
mixin _$MoodSentiment {
  String get icon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MoodSentiment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodSentiment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodSentimentCopyWith<MoodSentiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodSentimentCopyWith<$Res> {
  factory $MoodSentimentCopyWith(
          MoodSentiment value, $Res Function(MoodSentiment) then) =
      _$MoodSentimentCopyWithImpl<$Res, MoodSentiment>;
  @useResult
  $Res call({String icon, String name});
}

/// @nodoc
class _$MoodSentimentCopyWithImpl<$Res, $Val extends MoodSentiment>
    implements $MoodSentimentCopyWith<$Res> {
  _$MoodSentimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodSentiment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodSentimentImplCopyWith<$Res>
    implements $MoodSentimentCopyWith<$Res> {
  factory _$$MoodSentimentImplCopyWith(
          _$MoodSentimentImpl value, $Res Function(_$MoodSentimentImpl) then) =
      __$$MoodSentimentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, String name});
}

/// @nodoc
class __$$MoodSentimentImplCopyWithImpl<$Res>
    extends _$MoodSentimentCopyWithImpl<$Res, _$MoodSentimentImpl>
    implements _$$MoodSentimentImplCopyWith<$Res> {
  __$$MoodSentimentImplCopyWithImpl(
      _$MoodSentimentImpl _value, $Res Function(_$MoodSentimentImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodSentiment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? name = null,
  }) {
    return _then(_$MoodSentimentImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoodSentimentImpl extends _MoodSentiment {
  const _$MoodSentimentImpl({required this.icon, required this.name})
      : super._();

  factory _$MoodSentimentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodSentimentImplFromJson(json);

  @override
  final String icon;
  @override
  final String name;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodSentimentImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, name);

  /// Create a copy of MoodSentiment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodSentimentImplCopyWith<_$MoodSentimentImpl> get copyWith =>
      __$$MoodSentimentImplCopyWithImpl<_$MoodSentimentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodSentimentImplToJson(
      this,
    );
  }
}

abstract class _MoodSentiment extends MoodSentiment {
  const factory _MoodSentiment(
      {required final String icon,
      required final String name}) = _$MoodSentimentImpl;
  const _MoodSentiment._() : super._();

  factory _MoodSentiment.fromJson(Map<String, dynamic> json) =
      _$MoodSentimentImpl.fromJson;

  @override
  String get icon;
  @override
  String get name;

  /// Create a copy of MoodSentiment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodSentimentImplCopyWith<_$MoodSentimentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
