import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_preferences.freezed.dart';

part 'unit_preferences.g.dart';

@freezed
class UnitPreferences with _$UnitPreferences {
  const factory UnitPreferences({
    @Default(DistanceUnit.kilometers) DistanceUnit distance,
    @Default(EnergyUnit.calories) EnergyUnit energy,
    @Default(HeightUnit.centimeters) HeightUnit height,
    @Default(WaterUnit.milliliters) WaterUnit water,
    @Default(WeightUnit.kilograms) WeightUnit weight,
    @Default(WeightUnit.kilograms) WeightUnit workoutWeight,
  }) = _unitPreferences;

  factory UnitPreferences.fromJson(Map<String, dynamic> json) =>
      _$UnitPreferencesFromJson(json);
}
