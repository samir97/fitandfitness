// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoodActivity _$MoodActivityFromJson(Map<String, dynamic> json) {
  return _MoodActivity.fromJson(json);
}

/// @nodoc
mixin _$MoodActivity {
  String get icon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MoodActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodActivityCopyWith<MoodActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodActivityCopyWith<$Res> {
  factory $MoodActivityCopyWith(
          MoodActivity value, $Res Function(MoodActivity) then) =
      _$MoodActivityCopyWithImpl<$Res, MoodActivity>;
  @useResult
  $Res call({String icon, String name});
}

/// @nodoc
class _$MoodActivityCopyWithImpl<$Res, $Val extends MoodActivity>
    implements $MoodActivityCopyWith<$Res> {
  _$MoodActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodActivity
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
abstract class _$$MoodActivityImplCopyWith<$Res>
    implements $MoodActivityCopyWith<$Res> {
  factory _$$MoodActivityImplCopyWith(
          _$MoodActivityImpl value, $Res Function(_$MoodActivityImpl) then) =
      __$$MoodActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, String name});
}

/// @nodoc
class __$$MoodActivityImplCopyWithImpl<$Res>
    extends _$MoodActivityCopyWithImpl<$Res, _$MoodActivityImpl>
    implements _$$MoodActivityImplCopyWith<$Res> {
  __$$MoodActivityImplCopyWithImpl(
      _$MoodActivityImpl _value, $Res Function(_$MoodActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? name = null,
  }) {
    return _then(_$MoodActivityImpl(
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
class _$MoodActivityImpl extends _MoodActivity {
  const _$MoodActivityImpl({required this.icon, required this.name})
      : super._();

  factory _$MoodActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodActivityImplFromJson(json);

  @override
  final String icon;
  @override
  final String name;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodActivityImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, name);

  /// Create a copy of MoodActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodActivityImplCopyWith<_$MoodActivityImpl> get copyWith =>
      __$$MoodActivityImplCopyWithImpl<_$MoodActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodActivityImplToJson(
      this,
    );
  }
}

abstract class _MoodActivity extends MoodActivity {
  const factory _MoodActivity(
      {required final String icon,
      required final String name}) = _$MoodActivityImpl;
  const _MoodActivity._() : super._();

  factory _MoodActivity.fromJson(Map<String, dynamic> json) =
      _$MoodActivityImpl.fromJson;

  @override
  String get icon;
  @override
  String get name;

  /// Create a copy of MoodActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodActivityImplCopyWith<_$MoodActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
