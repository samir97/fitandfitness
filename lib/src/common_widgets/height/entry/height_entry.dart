import 'package:fitandfitness/src/common_widgets/height/entry/feet_and_inches_entry.dart';
import 'package:fitandfitness/src/common_widgets/labeled_value_shimmer.dart';
import 'package:fitandfitness/src/common_widgets/numeric_entry.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeightEntry extends ConsumerWidget {
  // height is in centimeters
  final double? height;
  final VoidCallback? onTap;
  final FocusNode focusNode;
  final Function(double?) onHeightChanged;

  const HeightEntry({
    super.key,
    this.height,
    this.onTap,
    required this.focusNode,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userDetailsAndPrefs) {
        final heightPreference = userDetailsAndPrefs?.unitPreferences.height ??
            HeightUnit.centimeters;
        final initialHeight = userDetailsAndPrefs?.userDetails.height;
        switch (heightPreference) {
          case HeightUnit.centimeters:
            return NumericEntry(
              prefix: "Height",
              suffix: "cm",
              initialValue: (initialHeight == 0) ? null : initialHeight,
              focusNode: focusNode,
              onValueChanged: onHeightChanged,
            );
          case HeightUnit.feetAndInches:
            return FeetAndInchesEntry(
              onTap: onTap,
              initialHeight: (initialHeight == 0) ? null : initialHeight,
              onHeightChanged: onHeightChanged,
            );
        }
      },
      loading: () => const LabeledValueShimmer(),
      error: (_, __) => NumericEntry(
        prefix: "Height",
        suffix: "cm",
        focusNode: focusNode,
        onValueChanged: onHeightChanged,
      ),
    );
  }
}
