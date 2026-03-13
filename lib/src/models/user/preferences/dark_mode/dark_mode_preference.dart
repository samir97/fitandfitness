import 'package:fitandfitness/src/models/user/preferences/dark_mode/dark_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dark_mode_preference.freezed.dart';

part 'dark_mode_preference.g.dart';

@freezed
class DarkModePreference with _$DarkModePreference {
  const factory DarkModePreference({
    @Default(DarkMode.automatic) DarkMode darkMode,
  }) = _DarkModePreference;

  factory DarkModePreference.fromJson(Map<String, dynamic> json) =>
      _$DarkModePreferenceFromJson(json);
}
