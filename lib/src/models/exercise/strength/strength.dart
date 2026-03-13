import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'strength.freezed.dart';

part 'strength.g.dart';

@freezed
class Strength with _$Strength implements ExerciseEntry {
  const Strength._();

  const factory Strength({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required StrengthExercise exercise,
    @JsonKey(name: 'number_of_sets') required int numberOfSets,
    @JsonKey(name: 'repetitions_per_set') required int repetitionsPerSet,
    @JsonKey(name: 'weight_per_set') double? weightPerSet,
    Cardio? cardio,
    @TimestampConverter()
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
  }) = _Strength;

  @override
  String summary() {
    return "${numberOfSets * repetitionsPerSet} reps";
  }

  factory Strength.fromJson(Map<String, dynamic> json) =>
      _$StrengthFromJson(json);
}
