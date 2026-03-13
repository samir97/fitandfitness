// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dark_mode_preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DarkModePreference _$DarkModePreferenceFromJson(Map<String, dynamic> json) {
  return _DarkModePreference.fromJson(json);
}

/// @nodoc
mixin _$DarkModePreference {
  DarkMode get darkMode => throw _privateConstructorUsedError;

  /// Serializes this DarkModePreference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DarkModePreference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DarkModePreferenceCopyWith<DarkModePreference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DarkModePreferenceCopyWith<$Res> {
  factory $DarkModePreferenceCopyWith(
          DarkModePreference value, $Res Function(DarkModePreference) then) =
      _$DarkModePreferenceCopyWithImpl<$Res, DarkModePreference>;
  @useResult
  $Res call({DarkMode darkMode});
}

/// @nodoc
class _$DarkModePreferenceCopyWithImpl<$Res, $Val extends DarkModePreference>
    implements $DarkModePreferenceCopyWith<$Res> {
  _$DarkModePreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DarkModePreference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
  }) {
    return _then(_value.copyWith(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as DarkMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DarkModePreferenceImplCopyWith<$Res>
    implements $DarkModePreferenceCopyWith<$Res> {
  factory _$$DarkModePreferenceImplCopyWith(_$DarkModePreferenceImpl value,
          $Res Function(_$DarkModePreferenceImpl) then) =
      __$$DarkModePreferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DarkMode darkMode});
}

/// @nodoc
class __$$DarkModePreferenceImplCopyWithImpl<$Res>
    extends _$DarkModePreferenceCopyWithImpl<$Res, _$DarkModePreferenceImpl>
    implements _$$DarkModePreferenceImplCopyWith<$Res> {
  __$$DarkModePreferenceImplCopyWithImpl(_$DarkModePreferenceImpl _value,
      $Res Function(_$DarkModePreferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DarkModePreference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
  }) {
    return _then(_$DarkModePreferenceImpl(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as DarkMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DarkModePreferenceImpl implements _DarkModePreference {
  const _$DarkModePreferenceImpl({this.darkMode = DarkMode.automatic});

  factory _$DarkModePreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DarkModePreferenceImplFromJson(json);

  @override
  @JsonKey()
  final DarkMode darkMode;

  @override
  String toString() {
    return 'DarkModePreference(darkMode: $darkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DarkModePreferenceImpl &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, darkMode);

  /// Create a copy of DarkModePreference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DarkModePreferenceImplCopyWith<_$DarkModePreferenceImpl> get copyWith =>
      __$$DarkModePreferenceImplCopyWithImpl<_$DarkModePreferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DarkModePreferenceImplToJson(
      this,
    );
  }
}

abstract class _DarkModePreference implements DarkModePreference {
  const factory _DarkModePreference({final DarkMode darkMode}) =
      _$DarkModePreferenceImpl;

  factory _DarkModePreference.fromJson(Map<String, dynamic> json) =
      _$DarkModePreferenceImpl.fromJson;

  @override
  DarkMode get darkMode;

  /// Create a copy of DarkModePreference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DarkModePreferenceImplCopyWith<_$DarkModePreferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
