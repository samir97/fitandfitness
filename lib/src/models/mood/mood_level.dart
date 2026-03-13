import 'package:freezed_annotation/freezed_annotation.dart';

enum MoodLevel {
  @JsonValue("very_bad")
  veryBad("Very Miserable"),
  @JsonValue("bad")
  bad("Rather Unhappy"),
  @JsonValue("normal")
  normal("Absolutely Fine"),
  @JsonValue("good")
  good("Pretty Good"),
  @JsonValue("very_good")
  veryGood("Totally Amazing");

  final String label;

  const MoodLevel(this.label);
}
