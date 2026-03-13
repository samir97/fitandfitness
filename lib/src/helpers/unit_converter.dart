class UnitConverter {
  // Conversion factors
  static const double _kilogramToPoundFactor = 2.2;
  static const double _kilogramToStoneFactor = 0.16;
  static const double _centimeterToInchFactor = 0.39;
  static const double _centimeterToFeetFactor = 0.032;
  static const double _kilometerToMileFactor = 0.62;
  static const double _calorieToKilojouleFactor = 4.184;
  static const double _milliliterToFluidOunceFactor = 0.034;
  static const double _milliliterToCupFactor = 0.0042;

  // Weight Conversions
  static double kilogramToPound(double kilogram) =>
      kilogram * _kilogramToPoundFactor;

  static double poundToKilogram(double pound) => pound / _kilogramToPoundFactor;

  static double kilogramToStone(double kilogram) =>
      kilogram * _kilogramToStoneFactor;

  static double stoneToKilogram(double stone) => stone / _kilogramToStoneFactor;

  // Height Conversions
  static double centimeterToInch(double centimeter) =>
      centimeter * _centimeterToInchFactor;

  static double inchToCentimeter(double inch) => inch / _centimeterToInchFactor;

  static double centimeterToFeet(double centimeter) =>
      centimeter * _centimeterToFeetFactor;

  static double feetToCentimeter(double feet) => feet / _centimeterToFeetFactor;

  // Distance Conversions
  static double kilometerToMile(double kilometer) =>
      kilometer * _kilometerToMileFactor;

  static double mileToKilometer(double mile) => mile / _kilometerToMileFactor;

  // Energy Conversions
  static double calorieToKilojoule(double calorie) =>
      calorie * _calorieToKilojouleFactor;

  static double kilojouleToCalorie(double kilojoule) =>
      kilojoule / _calorieToKilojouleFactor;

  // Water Conversions
  static double milliliterToFluidOunce(double milliliter) =>
      milliliter * _milliliterToFluidOunceFactor;

  static double fluidOunceToMilliliter(double fluidOunce) =>
      fluidOunce / _milliliterToFluidOunceFactor;

  static double milliliterToCup(double milliliter) =>
      milliliter * _milliliterToCupFactor;

  static double cupToMilliliter(double cup) => cup / _milliliterToCupFactor;
}
