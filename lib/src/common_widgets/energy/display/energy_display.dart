import 'package:fitandfitness/src/common_widgets/display_shimmer.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnergyDisplay extends ConsumerWidget {
  final double energy;
  final bool showUnits;

  const EnergyDisplay(this.energy, {super.key, this.showUnits = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userData) {
        final energyPreference =
            userData?.unitPreferences.energy ?? EnergyUnit.kilojoules;

        switch (energyPreference) {
          case EnergyUnit.kilojoules:
            return Text(
              "${energy.toShortString()} $energyPreference",
            );
          case EnergyUnit.calories:
            return Text(
              "${(energy / 4.18).toShortString()} $energyPreference",
            );
        }
      },
      error: (_, __) {
        return Text(
          "${energy.toShortString()} ${EnergyUnit.kilojoules}",
        );
      },
      loading: () => const DisplayShimmer(),
    );
  }
}
