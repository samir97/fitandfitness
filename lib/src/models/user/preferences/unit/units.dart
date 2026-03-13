import 'package:freezed_annotation/freezed_annotation.dart';

enum DistanceUnit {
  @JsonValue("meters")
  meters,
  @JsonValue("kilometers")
  kilometers,
  @JsonValue("miles")
  miles;

  @override
  String toString() {
    switch (this) {
      case DistanceUnit.meters:
        return "m";
      case DistanceUnit.kilometers:
        return "km";
      case DistanceUnit.miles:
        return "miles";
    }
  }
}

enum EnergyUnit {
  @JsonValue("calories")
  calories,
  @JsonValue("kilojoules")
  kilojoules;

  @override
  String toString() {
    switch (this) {
      case EnergyUnit.calories:
        return "cal";
      case EnergyUnit.kilojoules:
        return "kJ";
    }
  }
}

enum HeightUnit {
  @JsonValue("centimeters")
  centimeters,
  @JsonValue("feetAndInches")
  feetAndInches;

  @override
  String toString() {
    switch (this) {
      case HeightUnit.centimeters:
        return "cm";
      case HeightUnit.feetAndInches:
        return "ft";
    }
  }
}

enum WaterUnit {
  @JsonValue("cups")
  cups,
  @JsonValue("fluidOunces")
  fluidOunces,
  @JsonValue("milliliters")
  milliliters;

  @override
  String toString() {
    switch (this) {
      case WaterUnit.cups:
        return "cups";
      case WaterUnit.fluidOunces:
        return "fl oz";
      case WaterUnit.milliliters:
        return "ml";
    }
  }
}

enum WeightUnit {
  @JsonValue("kilograms")
  kilograms,
  @JsonValue("pounds")
  pounds,
  @JsonValue("stones")
  stones;

  @override
  String toString() {
    switch (this) {
      case WeightUnit.kilograms:
        return "kg";
      case WeightUnit.pounds:
        return "lbs";
      case WeightUnit.stones:
        return "st";
    }
  }
}
