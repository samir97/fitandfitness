import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/sleep/sleep_quality.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep.freezed.dart';

part 'sleep.g.dart';

@freezed
class Sleep with _$Sleep {
  const factory Sleep({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'sleep_quality') required SleepQuality sleepQuality,
    String? notes,
    @TimestampConverter() @JsonKey(name: 'slept_at') required DateTime sleptAt,
    @TimestampConverter()
    //Also used for wake up time
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
  }) = _Sleep;

  factory Sleep.fromJson(Map<String, dynamic> json) => _$SleepFromJson(json);
}
