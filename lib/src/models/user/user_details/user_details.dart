import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details.freezed.dart';

part 'user_details.g.dart';

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails({
    @JsonKey(name: 'first_name') required String firstName,
    @TimestampConverter() required DateTime birthdate,
    required UserSex sex,
    required double height,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
    @TimestampConverter()
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

enum UserSex {
  @JsonValue("female")
  female,
  @JsonValue("male")
  male,
  @JsonValue("other")
  other;

  @override
  String toString() {
    switch (this) {
      case UserSex.female:
        return "Female";
      case UserSex.male:
        return "Male";
      case UserSex.other:
        return "Other";
    }
  }

  static List<String> get stringValues =>
      UserSex.values.map((e) => e.toString()).toList();

  static UserSex? fromString(String? value) {
    if (value == null) return null;
    return UserSex.values.firstWhereOrNull((e) => e.toString() == value);
  }
}
