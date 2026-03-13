import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardio_exercise.freezed.dart';

part 'cardio_exercise.g.dart';

@freezed
class CardioExercise with _$CardioExercise implements Exercise {
  const factory CardioExercise({
    required String name,
    @JsonKey(name: 'cardio_activity') CardioActivity? cardioActivity,
    double? met,
    @JsonKey(name: 'is_preset') @Default(false) bool isPreset,
    @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime? recordedAt,
  }) = _CardioExercise;

  factory CardioExercise.fromJson(Map<String, dynamic> json) =>
      _$CardioExerciseFromJson(json);
}
