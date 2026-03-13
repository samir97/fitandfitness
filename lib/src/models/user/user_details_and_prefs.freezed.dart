// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_and_prefs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailsAndPrefs _$UserDetailsAndPrefsFromJson(Map<String, dynamic> json) {
  return _UserDetailsAndPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserDetailsAndPrefs {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isOnboarding => throw _privateConstructorUsedError;
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
  UserDetails get userDetails => throw _privateConstructorUsedError;
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
  UnitPreferences get unitPreferences => throw _privateConstructorUsedError;
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
  DarkModePreference get darkModePreference =>
      throw _privateConstructorUsedError;
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
  int get acceptedTermsVersion => throw _privateConstructorUsedError;

  /// Serializes this UserDetailsAndPrefs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsAndPrefsCopyWith<UserDetailsAndPrefs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsAndPrefsCopyWith<$Res> {
  factory $UserDetailsAndPrefsCopyWith(
          UserDetailsAndPrefs value, $Res Function(UserDetailsAndPrefs) then) =
      _$UserDetailsAndPrefsCopyWithImpl<$Res, UserDetailsAndPrefs>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isOnboarding,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
      UserDetails userDetails,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
      UnitPreferences unitPreferences,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
      DarkModePreference darkModePreference,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
      int acceptedTermsVersion});

  $UserDetailsCopyWith<$Res> get userDetails;
  $UnitPreferencesCopyWith<$Res> get unitPreferences;
  $DarkModePreferenceCopyWith<$Res> get darkModePreference;
}

/// @nodoc
class _$UserDetailsAndPrefsCopyWithImpl<$Res, $Val extends UserDetailsAndPrefs>
    implements $UserDetailsAndPrefsCopyWith<$Res> {
  _$UserDetailsAndPrefsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnboarding = null,
    Object? userDetails = null,
    Object? unitPreferences = null,
    Object? darkModePreference = null,
    Object? acceptedTermsVersion = null,
  }) {
    return _then(_value.copyWith(
      isOnboarding: null == isOnboarding
          ? _value.isOnboarding
          : isOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      unitPreferences: null == unitPreferences
          ? _value.unitPreferences
          : unitPreferences // ignore: cast_nullable_to_non_nullable
              as UnitPreferences,
      darkModePreference: null == darkModePreference
          ? _value.darkModePreference
          : darkModePreference // ignore: cast_nullable_to_non_nullable
              as DarkModePreference,
      acceptedTermsVersion: null == acceptedTermsVersion
          ? _value.acceptedTermsVersion
          : acceptedTermsVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get userDetails {
    return $UserDetailsCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnitPreferencesCopyWith<$Res> get unitPreferences {
    return $UnitPreferencesCopyWith<$Res>(_value.unitPreferences, (value) {
      return _then(_value.copyWith(unitPreferences: value) as $Val);
    });
  }

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DarkModePreferenceCopyWith<$Res> get darkModePreference {
    return $DarkModePreferenceCopyWith<$Res>(_value.darkModePreference,
        (value) {
      return _then(_value.copyWith(darkModePreference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDetailsAndPreferencesImplCopyWith<$Res>
    implements $UserDetailsAndPrefsCopyWith<$Res> {
  factory _$$UserDetailsAndPreferencesImplCopyWith(
          _$UserDetailsAndPreferencesImpl value,
          $Res Function(_$UserDetailsAndPreferencesImpl) then) =
      __$$UserDetailsAndPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isOnboarding,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
      UserDetails userDetails,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
      UnitPreferences unitPreferences,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
      DarkModePreference darkModePreference,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
      int acceptedTermsVersion});

  @override
  $UserDetailsCopyWith<$Res> get userDetails;
  @override
  $UnitPreferencesCopyWith<$Res> get unitPreferences;
  @override
  $DarkModePreferenceCopyWith<$Res> get darkModePreference;
}

/// @nodoc
class __$$UserDetailsAndPreferencesImplCopyWithImpl<$Res>
    extends _$UserDetailsAndPrefsCopyWithImpl<$Res,
        _$UserDetailsAndPreferencesImpl>
    implements _$$UserDetailsAndPreferencesImplCopyWith<$Res> {
  __$$UserDetailsAndPreferencesImplCopyWithImpl(
      _$UserDetailsAndPreferencesImpl _value,
      $Res Function(_$UserDetailsAndPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnboarding = null,
    Object? userDetails = null,
    Object? unitPreferences = null,
    Object? darkModePreference = null,
    Object? acceptedTermsVersion = null,
  }) {
    return _then(_$UserDetailsAndPreferencesImpl(
      isOnboarding: null == isOnboarding
          ? _value.isOnboarding
          : isOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
      unitPreferences: null == unitPreferences
          ? _value.unitPreferences
          : unitPreferences // ignore: cast_nullable_to_non_nullable
              as UnitPreferences,
      darkModePreference: null == darkModePreference
          ? _value.darkModePreference
          : darkModePreference // ignore: cast_nullable_to_non_nullable
              as DarkModePreference,
      acceptedTermsVersion: null == acceptedTermsVersion
          ? _value.acceptedTermsVersion
          : acceptedTermsVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsAndPreferencesImpl implements _UserDetailsAndPreferences {
  const _$UserDetailsAndPreferencesImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      this.isOnboarding = false,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
      required this.userDetails,
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
      this.unitPreferences = const UnitPreferences(),
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
      this.darkModePreference = const DarkModePreference(),
      @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
      required this.acceptedTermsVersion});

  factory _$UserDetailsAndPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsAndPreferencesImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isOnboarding;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
  final UserDetails userDetails;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
  final UnitPreferences unitPreferences;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
  final DarkModePreference darkModePreference;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
  final int acceptedTermsVersion;

  @override
  String toString() {
    return 'UserDetailsAndPrefs(isOnboarding: $isOnboarding, userDetails: $userDetails, unitPreferences: $unitPreferences, darkModePreference: $darkModePreference, acceptedTermsVersion: $acceptedTermsVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsAndPreferencesImpl &&
            (identical(other.isOnboarding, isOnboarding) ||
                other.isOnboarding == isOnboarding) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.unitPreferences, unitPreferences) ||
                other.unitPreferences == unitPreferences) &&
            (identical(other.darkModePreference, darkModePreference) ||
                other.darkModePreference == darkModePreference) &&
            (identical(other.acceptedTermsVersion, acceptedTermsVersion) ||
                other.acceptedTermsVersion == acceptedTermsVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isOnboarding, userDetails,
      unitPreferences, darkModePreference, acceptedTermsVersion);

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsAndPreferencesImplCopyWith<_$UserDetailsAndPreferencesImpl>
      get copyWith => __$$UserDetailsAndPreferencesImplCopyWithImpl<
          _$UserDetailsAndPreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsAndPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserDetailsAndPreferences implements UserDetailsAndPrefs {
  const factory _UserDetailsAndPreferences(
          {@JsonKey(includeFromJson: false, includeToJson: false)
          final bool isOnboarding,
          @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
          required final UserDetails userDetails,
          @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
          final UnitPreferences unitPreferences,
          @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
          final DarkModePreference darkModePreference,
          @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
          required final int acceptedTermsVersion}) =
      _$UserDetailsAndPreferencesImpl;

  factory _UserDetailsAndPreferences.fromJson(Map<String, dynamic> json) =
      _$UserDetailsAndPreferencesImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isOnboarding;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
  UserDetails get userDetails;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
  UnitPreferences get unitPreferences;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
  DarkModePreference get darkModePreference;
  @override
  @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
  int get acceptedTermsVersion;

  /// Create a copy of UserDetailsAndPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsAndPreferencesImplCopyWith<_$UserDetailsAndPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
