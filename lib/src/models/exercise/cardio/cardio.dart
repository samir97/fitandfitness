import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardio.freezed.dart';

part 'cardio.g.dart';

@freezed
class Cardio with _$Cardio implements ExerciseEntry {
  const Cardio._();

  const factory Cardio({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required CardioExercise exercise,
    @JsonKey(name: 'minutes_performed') required int minutesPerformed,
    @JsonKey(name: 'calories_burned') required double caloriesBurned,
    @TimestampConverter()
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
  }) = _Cardio;

  @override
  String summary() {
    return "$minutesPerformed mins";
  }

  factory Cardio.fromJson(Map<String, dynamic> json) => _$CardioFromJson(json);
}
