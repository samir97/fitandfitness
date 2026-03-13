import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum MotionType {
  @JsonValue("push")
  push,
  @JsonValue("pull")
  pull,
  @JsonValue("static")
  static;

  static List<String> get stringValues =>
      MotionType.values.map((e) => e.toString()).toList();

  @override
  String toString() {
    switch (this) {
      case MotionType.push:
        return "Push";
      case MotionType.pull:
        return "Pull";
      case MotionType.static:
        return "Static";
    }
  }

  static MotionType? fromString(String? value) {
    if (value == null) return null;
    return MotionType.values.firstWhereOrNull((e) => e.toString() == value);
  }
}
