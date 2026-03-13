// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardioExerciseImpl _$$CardioExerciseImplFromJson(Map<String, dynamic> json) =>
    _$CardioExerciseImpl(
      name: json['name'] as String,
      cardioActivity:
          $enumDecodeNullable(_$CardioActivityEnumMap, json['cardio_activity']),
      met: (json['met'] as num?)?.toDouble(),
      isPreset: json['is_preset'] as bool? ?? false,
      recordedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['recorded_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$CardioExerciseImplToJson(
        _$CardioExerciseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cardio_activity': _$CardioActivityEnumMap[instance.cardioActivity],
      'met': instance.met,
      'is_preset': instance.isPreset,
      'recorded_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.recordedAt, const TimestampConverter().toJson),
    };

const _$CardioActivityEnumMap = {
  CardioActivity.aerobics: 'aerobics',
  CardioActivity.bicycling: 'bicycling',
  CardioActivity.conditioningExercise: 'conditioning_exercise',
  CardioActivity.dancing: 'dancing',
  CardioActivity.fishing: 'fishing',
  CardioActivity.gardening: 'gardening',
  CardioActivity.musicPlaying: 'music_playing',
  CardioActivity.occupation: 'occupation',
  CardioActivity.running: 'running',
  CardioActivity.sports: 'sports',
  CardioActivity.walking: 'walking',
  CardioActivity.waterActivities: 'water_activities',
  CardioActivity.winterActivities: 'winter_activities',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
