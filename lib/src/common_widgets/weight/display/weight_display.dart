import 'package:fitandfitness/src/common_widgets/display_shimmer.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightDisplay extends ConsumerWidget {
  final double weight;
  final bool showUnits;
  final bool isWorkout;

  const WeightDisplay(
    this.weight, {
    super.key,
    this.showUnits = true,
    this.isWorkout = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userData) {
        final weightPreference = (isWorkout
                ? userData?.unitPreferences.workoutWeight
                : userData?.unitPreferences.weight) ??
            WeightUnit.kilograms;

        switch (weightPreference) {
          case WeightUnit.kilograms:
            return Text(
              "${weight.toShortString()} $weightPreference",
            );
          case WeightUnit.pounds:
            return Text(
              "${(weight * 2.2).toShortString()} $weightPreference",
            );
          case WeightUnit.stones:
            const double kgToPounds = 2.2;

            int totalPounds = (weight * kgToPounds).round();
            int stones = totalPounds ~/ 14;
            int pounds = totalPounds % 14;

            return Text("$stones st $pounds lbs");
        }
      },
      error: (_, __) {
        return Text(
          "${weight.toShortString()} ${WeightUnit.kilograms}",
        );
      },
      loading: () => const DisplayShimmer(),
    );
  }
}
