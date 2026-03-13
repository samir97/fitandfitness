import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/mood/mood_activity.dart';
import 'package:fitandfitness/src/models/mood/mood_level.dart';
import 'package:fitandfitness/src/models/mood/mood_sentiment.dart';
import 'package:fitandfitness/src/models/progress_photo.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood.freezed.dart';

part 'mood.g.dart';

@freezed
class Mood with _$Mood {
  const factory Mood({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'mood_level') @Default(MoodLevel.normal) MoodLevel moodLevel,
    @JsonKey(name: 'mood_sentiments')
    @Default({})
    Set<MoodSentiment> moodSentiments,
    @JsonKey(name: 'mood_activities')
    @Default({})
    Set<MoodActivity> moodActivities,
    @JsonKey(name: 'progress_photos') List<ProgressPhoto>? progressPhotos,
    @JsonKey(name: 'progress_photos_small')
    List<ProgressPhoto>? progressPhotosSmall,
    @JsonKey(name: 'progress_photos_medium')
    List<ProgressPhoto>? progressPhotosMedium,
    String? notes,
    @TimestampConverter()
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
  }) = _Mood;

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);
}
