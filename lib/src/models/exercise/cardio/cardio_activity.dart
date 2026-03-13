import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum CardioActivity {
  @JsonValue("aerobics")
  aerobics,
  @JsonValue("bicycling")
  bicycling,
  @JsonValue("conditioning_exercise")
  conditioningExercise,
  @JsonValue("dancing")
  dancing,
  @JsonValue("fishing")
  fishing,
  @JsonValue("gardening")
  gardening,
  @JsonValue("music_playing")
  musicPlaying,
  @JsonValue("occupation")
  occupation,
  @JsonValue("running")
  running,
  @JsonValue("sports")
  sports,
  @JsonValue("walking")
  walking,
  @JsonValue("water_activities")
  waterActivities,
  @JsonValue("winter_activities")
  winterActivities;

  static List<String> get stringValues =>
      CardioActivity.values.map((e) => e.toString()).toList();

  @override
  String toString() {
    switch (this) {
      case CardioActivity.aerobics:
        return "Aerobics";
      case CardioActivity.bicycling:
        return "Bicycling";
      case CardioActivity.conditioningExercise:
        return "Conditioning exercise";
      case CardioActivity.dancing:
        return "Dancing";
      case CardioActivity.fishing:
        return "Fishing";
      case CardioActivity.gardening:
        return "Gardening";
      case CardioActivity.musicPlaying:
        return "Music playing";
      case CardioActivity.occupation:
        return "Occupation";
      case CardioActivity.running:
        return "Running";
      case CardioActivity.sports:
        return "Sports";
      case CardioActivity.walking:
        return "Walking";
      case CardioActivity.waterActivities:
        return "Water activities";
      case CardioActivity.winterActivities:
        return "Winter activities";
    }
  }

  static CardioActivity? fromString(String? value) {
    if (value == null) return null;
    return CardioActivity.values.firstWhereOrNull((e) => e.toString() == value);
  }
}
