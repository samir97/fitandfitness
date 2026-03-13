// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$unitPreferencesImpl _$$unitPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$unitPreferencesImpl(
      distance: $enumDecodeNullable(_$DistanceUnitEnumMap, json['distance']) ??
          DistanceUnit.kilometers,
      energy: $enumDecodeNullable(_$EnergyUnitEnumMap, json['energy']) ??
          EnergyUnit.calories,
      height: $enumDecodeNullable(_$HeightUnitEnumMap, json['height']) ??
          HeightUnit.centimeters,
      water: $enumDecodeNullable(_$WaterUnitEnumMap, json['water']) ??
          WaterUnit.milliliters,
      weight: $enumDecodeNullable(_$WeightUnitEnumMap, json['weight']) ??
          WeightUnit.kilograms,
      workoutWeight:
          $enumDecodeNullable(_$WeightUnitEnumMap, json['workoutWeight']) ??
              WeightUnit.kilograms,
    );

Map<String, dynamic> _$$unitPreferencesImplToJson(
        _$unitPreferencesImpl instance) =>
    <String, dynamic>{
      'distance': _$DistanceUnitEnumMap[instance.distance]!,
      'energy': _$EnergyUnitEnumMap[instance.energy]!,
      'height': _$HeightUnitEnumMap[instance.height]!,
      'water': _$WaterUnitEnumMap[instance.water]!,
      'weight': _$WeightUnitEnumMap[instance.weight]!,
      'workoutWeight': _$WeightUnitEnumMap[instance.workoutWeight]!,
    };

const _$DistanceUnitEnumMap = {
  DistanceUnit.meters: 'meters',
  DistanceUnit.kilometers: 'kilometers',
  DistanceUnit.miles: 'miles',
};

const _$EnergyUnitEnumMap = {
  EnergyUnit.calories: 'calories',
  EnergyUnit.kilojoules: 'kilojoules',
};

const _$HeightUnitEnumMap = {
  HeightUnit.centimeters: 'centimeters',
  HeightUnit.feetAndInches: 'feetAndInches',
};

const _$WaterUnitEnumMap = {
  WaterUnit.cups: 'cups',
  WaterUnit.fluidOunces: 'fluidOunces',
  WaterUnit.milliliters: 'milliliters',
};

const _$WeightUnitEnumMap = {
  WeightUnit.kilograms: 'kilograms',
  WeightUnit.pounds: 'pounds',
  WeightUnit.stones: 'stones',
};
