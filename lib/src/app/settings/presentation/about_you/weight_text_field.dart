import 'package:fitandfitness/src/common_widgets/permanent_prefix_text_field.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightTextField extends ConsumerWidget {
  final TextEditingController weightTextEditingController;
  final FocusNode weightFocusNode;

  const WeightTextField({
    super.key,
    required this.weightTextEditingController,
    required this.weightFocusNode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const weightPreference = WeightUnit.kilograms;

    String suffix = "";

    switch (weightPreference) {
      case WeightUnit.pounds:
        suffix = "lbs";
        break;
      case WeightUnit.kilograms:
        suffix = "kg";
        break;
      case WeightUnit.stones:
        suffix = "st";
        break;
    }

    return PermanentPrefixTextField(
      prefix: "Weight",
      suffix: suffix,
      textEditingController: weightTextEditingController,
      focusNode: weightFocusNode,
    );
  }
}
