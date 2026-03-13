// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrengthImpl _$$StrengthImplFromJson(Map<String, dynamic> json) =>
    _$StrengthImpl(
      exercise:
          StrengthExercise.fromJson(json['exercise'] as Map<String, dynamic>),
      numberOfSets: (json['number_of_sets'] as num).toInt(),
      repetitionsPerSet: (json['repetitions_per_set'] as num).toInt(),
      weightPerSet: (json['weight_per_set'] as num?)?.toDouble(),
      cardio: json['cardio'] == null
          ? null
          : Cardio.fromJson(json['cardio'] as Map<String, dynamic>),
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
    );

Map<String, dynamic> _$$StrengthImplToJson(_$StrengthImpl instance) =>
    <String, dynamic>{
      'exercise': instance.exercise.toJson(),
      'number_of_sets': instance.numberOfSets,
      'repetitions_per_set': instance.repetitionsPerSet,
      'weight_per_set': instance.weightPerSet,
      'cardio': instance.cardio?.toJson(),
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
    };
