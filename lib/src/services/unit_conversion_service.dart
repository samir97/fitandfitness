import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:intl/intl.dart';

class UnitConversionService {
  static String date({
    required DateTime dateTime,
    bool withDay = false,
    bool prettify = true,
  }) {
    late DateFormat dateFormat;

    if (withDay) {
      dateFormat = DateFormat.E();
    }

    return dateFormat.format(dateTime);
  }

  static double weight({
    required double value,
    required WeightUnit preference,
    required bool toMetric,
  }) {
    if (toMetric) {
      switch (preference) {
        case WeightUnit.pounds:
          return value * 0.45359237;
        case WeightUnit.kilograms:
          return value;
        case WeightUnit.stones:
          return value * 6.35029;
      }
    } else {
      switch (preference) {
        case WeightUnit.pounds:
          return value / 0.45359237;
        case WeightUnit.kilograms:
          return value;
        case WeightUnit.stones:
          return value / 6.35029;
      }
    }
  }

  static double heightFormatter({
    required double value,
    required HeightUnit preference,
    required bool toMetric,
  }) {
    if (toMetric) {
      switch (preference) {
        case HeightUnit.feetAndInches:
          return value * 30.48;
        case HeightUnit.centimeters:
          return value;
      }
    } else {
      switch (preference) {
        case HeightUnit.feetAndInches:
          return value / 30.48;
        case HeightUnit.centimeters:
          return value;
      }
    }
  }

  static double distancePreferenceToMetric({
    required double value,
    required DistanceUnit preference,
    required bool toMetric,
  }) {
    if (toMetric) {
      switch (preference) {
        case DistanceUnit.miles:
          return value * 1.609344;
        case DistanceUnit.kilometers:
          return value * 1000;
        case DistanceUnit.meters:
          return value;
      }
    } else {
      switch (preference) {
        case DistanceUnit.miles:
          return value / 1.609344;
        case DistanceUnit.kilometers:
          return value / 1000;
        case DistanceUnit.meters:
          return value;
      }
    }
  }

  static double energyPreferenceToMetric({
    required double value,
    required EnergyUnit preference,
    required bool toMetric,
  }) {
    if (toMetric) {
      switch (preference) {
        case EnergyUnit.calories:
          return value * 4.184;
        case EnergyUnit.kilojoules:
          return value;
      }
    } else {
      switch (preference) {
        case EnergyUnit.calories:
          return value / 4.184;
        case EnergyUnit.kilojoules:
          return value;
      }
    }
  }

  static double waterPreferenceToMetric({
    required double value,
    required WaterUnit preference,
    required bool toMetric,
  }) {
    if (toMetric) {
      switch (preference) {
        case WaterUnit.cups:
          return value * 236.6;
        case WaterUnit.milliliters:
          return value;
        case WaterUnit.fluidOunces:
          return value * 29.57353;
      }
    } else {
      switch (preference) {
        case WaterUnit.cups:
          return value / 236.6;
        case WaterUnit.milliliters:
          return value;
        case WaterUnit.fluidOunces:
          return value / 29.57353;
      }
    }
  }
}
