// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardioImpl _$$CardioImplFromJson(Map<String, dynamic> json) => _$CardioImpl(
      exercise:
          CardioExercise.fromJson(json['exercise'] as Map<String, dynamic>),
      minutesPerformed: (json['minutes_performed'] as num).toInt(),
      caloriesBurned: (json['calories_burned'] as num).toDouble(),
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
    );

Map<String, dynamic> _$$CardioImplToJson(_$CardioImpl instance) =>
    <String, dynamic>{
      'exercise': instance.exercise.toJson(),
      'minutes_performed': instance.minutesPerformed,
      'calories_burned': instance.caloriesBurned,
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
    };
