import 'package:freezed_annotation/freezed_annotation.dart';

enum DarkMode {
  @JsonValue('automatic')
  automatic,
  @JsonValue('always_on')
  alwaysOn,
  @JsonValue('always_off')
  alwaysOff,
}
