// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrengthExerciseImpl _$$StrengthExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$StrengthExerciseImpl(
      name: json['name'] as String,
      muscleGroups: (json['muscle_groups'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MuscleGroupEnumMap, e))
          .toList(),
      experienceLevel: $enumDecodeNullable(
          _$ExperienceLevelEnumMap, json['experience_level']),
      motionType: $enumDecodeNullable(_$MotionTypeEnumMap, json['motion_type']),
      isPreset: json['is_preset'] as bool? ?? false,
      recordedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['recorded_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$StrengthExerciseImplToJson(
        _$StrengthExerciseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'muscle_groups':
          instance.muscleGroups?.map((e) => _$MuscleGroupEnumMap[e]!).toList(),
      'experience_level': _$ExperienceLevelEnumMap[instance.experienceLevel],
      'motion_type': _$MotionTypeEnumMap[instance.motionType],
      'is_preset': instance.isPreset,
      'recorded_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.recordedAt, const TimestampConverter().toJson),
    };

const _$MuscleGroupEnumMap = {
  MuscleGroup.abdominalsLower: 'abdominals_lower',
  MuscleGroup.abdominalsObliques: 'abdominals_obliques',
  MuscleGroup.abdominalsTotal: 'abdominals_total',
  MuscleGroup.abdominalsUpper: 'abdominals_upper',
  MuscleGroup.backLatissimusDorsi: 'back_latissimus_dorsi',
  MuscleGroup.backLatDorsiOrRhomboids: 'back_lat_dorsi_or_rhomboids',
  MuscleGroup.biceps: 'biceps',
  MuscleGroup.calvesGastrocnemius: 'calves_gastrocnemius',
  MuscleGroup.calvesSoleus: 'calves_soleus',
  MuscleGroup.chestPectoralis: 'chest_pectoralis',
  MuscleGroup.legsHamstrings: 'legs_hamstrings',
  MuscleGroup.legsQuadriceps: 'legs_quadriceps',
  MuscleGroup.lowerBackErectorSpinae: 'lower_back_erector_spinae',
  MuscleGroup.shouldersDeltsOrTraps: 'shoulders_delts_or_traps',
  MuscleGroup.shouldersRotatorCuff: 'shoulders_rotator_cuff',
  MuscleGroup.triceps: 'triceps',
};

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.advanced: 'advanced',
};

const _$MotionTypeEnumMap = {
  MotionType.push: 'push',
  MotionType.pull: 'pull',
  MotionType.static: 'static',
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
