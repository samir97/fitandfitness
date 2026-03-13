import 'package:fitandfitness/src/common_widgets/labeled_value_shimmer.dart';
import 'package:fitandfitness/src/common_widgets/numeric_entry.dart';
import 'package:fitandfitness/src/common_widgets/weight/entry/stones_entry.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightEntry extends ConsumerWidget {
  // weight is in kilograms
  final double? weight;
  final Function? onTap;
  final FocusNode focusNode;
  final Function(double?) onWeightChanged;

  const WeightEntry({
    super.key,
    this.weight,
    this.onTap,
    required this.focusNode,
    required this.onWeightChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userDetailsAndPrefs) {
        final weightPreference =
            userDetailsAndPrefs?.unitPreferences.weight ?? WeightUnit.kilograms;

        switch (weightPreference) {
          case WeightUnit.kilograms:
            return NumericEntry(
                prefix: "Weight",
                suffix: "kg",
                initialValue: weight,
                focusNode: focusNode,
                onValueChanged: onWeightChanged);
          case WeightUnit.pounds:
            return NumericEntry(
                prefix: "Weight",
                suffix: "lbs",
                initialValue: (weight == null) ? null : (weight! * 2.2),
                focusNode: focusNode,
                onValueChanged: (value) {
                  double limitedValue = (value ?? 0) / 2.2;
                  onWeightChanged(limitedValue);
                });
          case WeightUnit.stones:
            return StonesEntry(
                weight: weight, onTap: onTap, onWeightChanged: onWeightChanged);
        }
      },
      loading: () => const LabeledValueShimmer(),
      error: (_, __) => NumericEntry(
          prefix: "Weight",
          suffix: "kg",
          initialValue: weight,
          focusNode: focusNode,
          onValueChanged: onWeightChanged),
    );
  }
}
