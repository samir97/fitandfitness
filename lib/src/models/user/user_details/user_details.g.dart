// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      firstName: json['first_name'] as String,
      birthdate:
          const TimestampConverter().fromJson(json['birthdate'] as Timestamp),
      sex: $enumDecode(_$UserSexEnumMap, json['sex']),
      height: (json['height'] as num).toDouble(),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'birthdate': const TimestampConverter().toJson(instance.birthdate),
      'sex': _$UserSexEnumMap[instance.sex]!,
      'height': instance.height,
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
    };

const _$UserSexEnumMap = {
  UserSex.female: 'female',
  UserSex.male: 'male',
  UserSex.other: 'other',
};
