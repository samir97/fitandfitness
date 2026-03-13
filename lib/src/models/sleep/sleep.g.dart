// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepImpl _$$SleepImplFromJson(Map<String, dynamic> json) => _$SleepImpl(
      sleepQuality: $enumDecode(_$SleepQualityEnumMap, json['sleep_quality']),
      notes: json['notes'] as String?,
      sleptAt:
          const TimestampConverter().fromJson(json['slept_at'] as Timestamp),
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
    );

Map<String, dynamic> _$$SleepImplToJson(_$SleepImpl instance) =>
    <String, dynamic>{
      'sleep_quality': _$SleepQualityEnumMap[instance.sleepQuality]!,
      'notes': instance.notes,
      'slept_at': const TimestampConverter().toJson(instance.sleptAt),
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
    };

const _$SleepQualityEnumMap = {
  SleepQuality.veryBad: 'very_bad',
  SleepQuality.bad: 'bad',
  SleepQuality.good: 'good',
  SleepQuality.veryGood: 'very_good',
  SleepQuality.excellent: 'excellent',
};
