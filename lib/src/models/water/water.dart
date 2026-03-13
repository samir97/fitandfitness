import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'water.freezed.dart';

part 'water.g.dart';

@freezed
class Water with _$Water {
  const factory Water({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required double quantity,
    @TimestampConverter()
    @JsonKey(name: 'recorded_at')
    required DateTime recordedAt,
    @TimestampConverter()
    @JsonKey(name: 'modified_at')
    required DateTime modifiedAt,
  }) = _Water;

  factory Water.fromJson(Map<String, dynamic> json) => _$WaterFromJson(json);
}
