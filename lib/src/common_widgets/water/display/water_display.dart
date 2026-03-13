import 'package:fitandfitness/src/common_widgets/display_shimmer.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaterDisplay extends ConsumerWidget {
  final double water;
  final bool showUnits;

  const WaterDisplay(this.water, {super.key, this.showUnits = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userData) {
        final waterPreference =
            userData?.unitPreferences.water ?? WaterUnit.milliliters;

        switch (waterPreference) {
          case WaterUnit.milliliters:
            return Text(
              "${water.toShortString()} $waterPreference",
            );
          case WaterUnit.cups:
            return Text(
              "${(water / 236.59).toShortString()} $waterPreference",
            );
          case WaterUnit.fluidOunces:
            return Text(
              "${(water / 29.57).toShortString()} $waterPreference",
            );
        }
      },
      error: (_, __) {
        return Text(
          "${water.toShortString()} ${WaterUnit.milliliters}",
        );
      },
      loading: () => const DisplayShimmer(),
    );
  }
}
