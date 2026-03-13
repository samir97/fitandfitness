import 'package:fitandfitness/src/models/user/preferences/dark_mode/dark_mode_preference.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_and_prefs.freezed.dart';

part 'user_details_and_prefs.g.dart';

@immutable
class UserDetailsAndPrefsStorageKeys {
  static const users = 'users';
  static const userDetails = 'user_details';
  static const unitPreferences = 'unit_preferences';
  static const darkModePreference = 'dark_mode_preference';
  static const acceptedTermsVersion = 'accepted_terms_version';
}

@freezed
class UserDetailsAndPrefs with _$UserDetailsAndPrefs {
  const factory UserDetailsAndPrefs({
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isOnboarding,
    @JsonKey(name: UserDetailsAndPrefsStorageKeys.userDetails)
    required UserDetails userDetails,
    @JsonKey(name: UserDetailsAndPrefsStorageKeys.unitPreferences)
    @Default(UnitPreferences())
    UnitPreferences unitPreferences,
    @JsonKey(name: UserDetailsAndPrefsStorageKeys.darkModePreference)
    @Default(DarkModePreference())
    DarkModePreference darkModePreference,
    @JsonKey(name: UserDetailsAndPrefsStorageKeys.acceptedTermsVersion)
    required int acceptedTermsVersion,
  }) = _UserDetailsAndPreferences;

  factory UserDetailsAndPrefs.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsAndPrefsFromJson(json);
}
