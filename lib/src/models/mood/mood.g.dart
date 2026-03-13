// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodImpl _$$MoodImplFromJson(Map<String, dynamic> json) => _$MoodImpl(
      moodLevel: $enumDecodeNullable(_$MoodLevelEnumMap, json['mood_level']) ??
          MoodLevel.normal,
      moodSentiments: (json['mood_sentiments'] as List<dynamic>?)
              ?.map((e) => MoodSentiment.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      moodActivities: (json['mood_activities'] as List<dynamic>?)
              ?.map((e) => MoodActivity.fromJson(e as Map<String, dynamic>))
              .toSet() ??
          const {},
      progressPhotos: (json['progress_photos'] as List<dynamic>?)
          ?.map((e) => ProgressPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      progressPhotosSmall: (json['progress_photos_small'] as List<dynamic>?)
          ?.map((e) => ProgressPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      progressPhotosMedium: (json['progress_photos_medium'] as List<dynamic>?)
          ?.map((e) => ProgressPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
    );

Map<String, dynamic> _$$MoodImplToJson(_$MoodImpl instance) =>
    <String, dynamic>{
      'mood_level': _$MoodLevelEnumMap[instance.moodLevel]!,
      'mood_sentiments':
          instance.moodSentiments.map((e) => e.toJson()).toList(),
      'mood_activities':
          instance.moodActivities.map((e) => e.toJson()).toList(),
      'progress_photos':
          instance.progressPhotos?.map((e) => e.toJson()).toList(),
      'progress_photos_small':
          instance.progressPhotosSmall?.map((e) => e.toJson()).toList(),
      'progress_photos_medium':
          instance.progressPhotosMedium?.map((e) => e.toJson()).toList(),
      'notes': instance.notes,
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
    };

const _$MoodLevelEnumMap = {
  MoodLevel.veryBad: 'very_bad',
  MoodLevel.bad: 'bad',
  MoodLevel.normal: 'normal',
  MoodLevel.good: 'good',
  MoodLevel.veryGood: 'very_good',
};
