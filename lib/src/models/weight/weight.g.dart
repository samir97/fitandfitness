// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightImpl _$$WeightImplFromJson(Map<String, dynamic> json) => _$WeightImpl(
      weight: (json['weight'] as num).toDouble(),
      bodyFat: (json['body_fat'] as num?)?.toDouble(),
      muscleMass: (json['muscle_mass'] as num?)?.toDouble(),
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

Map<String, dynamic> _$$WeightImplToJson(_$WeightImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'body_fat': instance.bodyFat,
      'muscle_mass': instance.muscleMass,
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
