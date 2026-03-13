// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterImpl _$$WaterImplFromJson(Map<String, dynamic> json) => _$WaterImpl(
      quantity: (json['quantity'] as num).toDouble(),
      recordedAt:
          const TimestampConverter().fromJson(json['recorded_at'] as Timestamp),
      modifiedAt:
          const TimestampConverter().fromJson(json['modified_at'] as Timestamp),
    );

Map<String, dynamic> _$$WaterImplToJson(_$WaterImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'recorded_at': const TimestampConverter().toJson(instance.recordedAt),
      'modified_at': const TimestampConverter().toJson(instance.modifiedAt),
    };
