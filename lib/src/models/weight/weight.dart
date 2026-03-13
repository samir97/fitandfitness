import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/progress_photo.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight.freezed.dart';

part 'weight.g.dart';

@freezed
class Weight with _$Weight {
  const factory Weight({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required double weight,
    @JsonKey(name: 'body_fat') double? bodyFat,
    @JsonKey(name: 'muscle_mass') double? muscleMass,
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
  }) = _Weight;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
