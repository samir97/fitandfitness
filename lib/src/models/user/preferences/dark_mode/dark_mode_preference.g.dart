// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark_mode_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DarkModePreferenceImpl _$$DarkModePreferenceImplFromJson(
        Map<String, dynamic> json) =>
    _$DarkModePreferenceImpl(
      darkMode: $enumDecodeNullable(_$DarkModeEnumMap, json['darkMode']) ??
          DarkMode.automatic,
    );

Map<String, dynamic> _$$DarkModePreferenceImplToJson(
        _$DarkModePreferenceImpl instance) =>
    <String, dynamic>{
      'darkMode': _$DarkModeEnumMap[instance.darkMode]!,
    };

const _$DarkModeEnumMap = {
  DarkMode.automatic: 'automatic',
  DarkMode.alwaysOn: 'always_on',
  DarkMode.alwaysOff: 'always_off',
};
