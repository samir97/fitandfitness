import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/experience_level.dart';
import 'package:fitandfitness/src/models/exercise/strength/motion_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/muscle_group.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'strength_exercise.freezed.dart';
part 'strength_exercise.g.dart';

@freezed
class StrengthExercise with _$StrengthExercise implements Exercise {
  const factory StrengthExercise({
    required String name,
    @JsonKey(name: 'muscle_groups') List<MuscleGroup>? muscleGroups,
    @JsonKey(name: 'experience_level') ExperienceLevel? experienceLevel,
    @JsonKey(name: 'motion_type') MotionType? motionType,
    @JsonKey(name: 'is_preset') @Default(false) bool isPreset,
    @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime? recordedAt,
  }) = _StrengthExercise;

  factory StrengthExercise.fromJson(Map<String, dynamic> json) =>
      _$StrengthExerciseFromJson(json);
}
