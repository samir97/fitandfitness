// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_and_prefs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsAndPreferencesImpl _$$UserDetailsAndPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailsAndPreferencesImpl(
      userDetails:
          UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
      unitPreferences: json['unit_preferences'] == null
          ? const UnitPreferences()
          : UnitPreferences.fromJson(
              json['unit_preferences'] as Map<String, dynamic>),
      darkModePreference: json['dark_mode_preference'] == null
          ? const DarkModePreference()
          : DarkModePreference.fromJson(
              json['dark_mode_preference'] as Map<String, dynamic>),
      acceptedTermsVersion: (json['accepted_terms_version'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDetailsAndPreferencesImplToJson(
        _$UserDetailsAndPreferencesImpl instance) =>
    <String, dynamic>{
      'user_details': instance.userDetails.toJson(),
      'unit_preferences': instance.unitPreferences.toJson(),
      'dark_mode_preference': instance.darkModePreference.toJson(),
      'accepted_terms_version': instance.acceptedTermsVersion,
    };
