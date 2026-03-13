import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum SleepQuality {
  @JsonValue("very_bad")
  veryBad,
  @JsonValue("bad")
  bad,
  @JsonValue("good")
  good,
  @JsonValue("very_good")
  veryGood,
  @JsonValue("excellent")
  excellent;

  @override
  String toString() {
    switch (this) {
      case SleepQuality.veryBad:
        return "Very Bad";
      case SleepQuality.bad:
        return "Bad";
      case SleepQuality.good:
        return "Good";
      case SleepQuality.veryGood:
        return "Very Good";
      case SleepQuality.excellent:
        return "Excellent";
    }
  }

  static List<String> get stringValues =>
      SleepQuality.values.map((e) => e.toString()).toList();

  static SleepQuality? fromString(String? value) {
    if (value == null) return null;
    return SleepQuality.values.firstWhereOrNull((e) => e.toString() == value);
  }
}
