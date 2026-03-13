import 'package:fitandfitness/src/app/settings/presentation/units/onboarding_unit_preferences_fab.dart';
import 'package:fitandfitness/src/app/settings/presentation/units/unit_selection_list_tile.dart';
import 'package:fitandfitness/src/app/settings/presentation/units/units_sub_list.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnitPreferencesScreen extends ConsumerStatefulWidget {
  final UnitPreferences? unitPreferences;

  const UnitPreferencesScreen({super.key, this.unitPreferences});

  @override
  ConsumerState<UnitPreferencesScreen> createState() =>
      _UnitPreferencesScreenState();
}

class _UnitPreferencesScreenState extends ConsumerState<UnitPreferencesScreen> {
  late UnitPreferences _tempUnitPreferences;

  @override
  void initState() {
    super.initState();
    _tempUnitPreferences = widget.unitPreferences ?? const UnitPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.unitPreferences == null) {
      Locale myLocale = Localizations.localeOf(context);
      String countryCode = myLocale.countryCode ?? 'default';
      _tempUnitPreferences = _getUnitPreferencesForCountry(countryCode);
    }
  }

  UnitPreferences _getUnitPreferencesForCountry(String countryCode) {
    switch (countryCode) {
      case 'US':
        return const UnitPreferences(
          distance: DistanceUnit.miles,
          energy: EnergyUnit.calories,
          height: HeightUnit.feetAndInches,
          water: WaterUnit.fluidOunces,
          weight: WeightUnit.pounds,
          workoutWeight: WeightUnit.pounds,
        );
      case 'GB':
        return const UnitPreferences(
          distance: DistanceUnit.miles,
          energy: EnergyUnit.calories,
          height: HeightUnit.feetAndInches,
          water: WaterUnit.milliliters,
          weight: WeightUnit.stones,
          workoutWeight: WeightUnit.kilograms,
        );
      default:
        return const UnitPreferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.read(userDetailsAndPrefsControllerProvider.notifier);
    final isOnboarding = widget.unitPreferences == null;

    return PopScope(
      canPop: !isOnboarding,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Unit Preferences"),
          automaticallyImplyLeading: !isOnboarding,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              UnitsSubList(
                title: "Body Weight",
                units: [
                  UnitSelectionListTile<WeightUnit>(
                    title: "Kilograms",
                    value: WeightUnit.kilograms,
                    currentPreference: _tempUnitPreferences.weight,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(weight: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                  UnitSelectionListTile<WeightUnit>(
                    title: "Pounds",
                    value: WeightUnit.pounds,
                    currentPreference: _tempUnitPreferences.weight,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(weight: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                  UnitSelectionListTile<WeightUnit>(
                    title: "Stones",
                    value: WeightUnit.stones,
                    currentPreference: _tempUnitPreferences.weight,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(weight: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                ],
              ),
              UnitsSubList(
                title: "Workout Weight",
                units: [
                  UnitSelectionListTile<WeightUnit>(
                    title: "Kilograms",
                    value: WeightUnit.kilograms,
                    currentPreference: _tempUnitPreferences.workoutWeight,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(workoutWeight: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                  UnitSelectionListTile<WeightUnit>(
                    title: "Pounds",
                    value: WeightUnit.pounds,
                    currentPreference: _tempUnitPreferences.workoutWeight,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(workoutWeight: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                ],
              ),
              UnitsSubList(
                title: "Height",
                units: [
                  UnitSelectionListTile<HeightUnit>(
                    title: "Centimeters",
                    value: HeightUnit.centimeters,
                    currentPreference: _tempUnitPreferences.height,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(height: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                  UnitSelectionListTile<HeightUnit>(
                    title: "Feet / Inches",
                    value: HeightUnit.feetAndInches,
                    currentPreference: _tempUnitPreferences.height,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(height: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                ],
              ),
              UnitsSubList(
                title: "Distance",
                units: [
                  UnitSelectionListTile<DistanceUnit>(
                    title: "Kilometers",
                    value: DistanceUnit.kilometers,
                    currentPreference: _tempUnitPreferences.distance,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(distance: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                  UnitSelectionListTile<DistanceUnit>(
                    title: "Miles",
                    value: DistanceUnit.miles,
                    currentPreference: _tempUnitPreferences.distance,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(distance: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                          userDetailsAndPrefsController:
                              userDetailsAndPrefsController);
                    },
                  ),
                ],
              ),
              UnitsSubList(
                title: "Energy",
                units: [
                  UnitSelectionListTile<EnergyUnit>(
                    title: "Calories",
                    value: EnergyUnit.calories,
                    currentPreference: _tempUnitPreferences.energy,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(energy: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                        userDetailsAndPrefsController:
                            userDetailsAndPrefsController,
                      );
                    },
                  ),
                  UnitSelectionListTile<EnergyUnit>(
                    title: "Kilojoules",
                    value: EnergyUnit.kilojoules,
                    currentPreference: _tempUnitPreferences.energy,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(energy: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                        userDetailsAndPrefsController:
                            userDetailsAndPrefsController,
                      );
                    },
                  ),
                ],
              ),
              UnitsSubList(
                title: "Water",
                units: [
                  UnitSelectionListTile<WaterUnit>(
                    title: "Cups",
                    value: WaterUnit.cups,
                    currentPreference: _tempUnitPreferences.water,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(water: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                        userDetailsAndPrefsController:
                            userDetailsAndPrefsController,
                      );
                    },
                  ),
                  UnitSelectionListTile<WaterUnit>(
                    title: "Milliliters",
                    value: WaterUnit.milliliters,
                    currentPreference: _tempUnitPreferences.water,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(water: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                        userDetailsAndPrefsController:
                            userDetailsAndPrefsController,
                      );
                    },
                  ),
                  UnitSelectionListTile<WaterUnit>(
                    title: "Fluid Ounces",
                    value: WaterUnit.fluidOunces,
                    currentPreference: _tempUnitPreferences.water,
                    updatePreference: (value) =>
                        _tempUnitPreferences.copyWith(water: value),
                    onUpdate: (updatedPreference) {
                      setState(() {
                        _tempUnitPreferences = updatedPreference;
                      });
                      editUnitPreferences(
                        userDetailsAndPrefsController:
                            userDetailsAndPrefsController,
                      );
                    },
                  ),
                ],
              ),
              if (isOnboarding)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom + 96,
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: isOnboarding
            ? OnboardingUnitPreferencesFab(
                unitPreferences: _tempUnitPreferences,
              )
            : null,
      ),
    );
  }

  void editUnitPreferences({
    required UserDetailsAndPrefsController userDetailsAndPrefsController,
  }) {
    if (widget.unitPreferences != null) {
      userDetailsAndPrefsController.editUnitPreferences(
        _tempUnitPreferences,
      );
    }
  }
}
