import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ExperienceLevel {
  @JsonValue("beginner")
  beginner,
  @JsonValue("intermediate")
  intermediate,
  @JsonValue("advanced")
  advanced;

  static List<String> get stringValues =>
      ExperienceLevel.values.map((e) => e.toString()).toList();

  @override
  String toString() {
    switch (this) {
      case ExperienceLevel.beginner:
        return "Beginner";
      case ExperienceLevel.intermediate:
        return "Intermediate";
      case ExperienceLevel.advanced:
        return "Advanced";
    }
  }

  static ExperienceLevel? fromString(String? value) {
    if (value == null) return null;
    return ExperienceLevel.values
        .firstWhereOrNull((e) => e.toString() == value);
  }
}
