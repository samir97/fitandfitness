import 'package:fitandfitness/src/app/data_entry/presentation/shimmer_text_field_tile_with_units.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/text_field_tile_with_units.dart';
import 'package:fitandfitness/src/common_widgets/weight/entry/stones_entry.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightEntryListTile extends ConsumerStatefulWidget {
  final double? weight;
  final VoidCallback onTap;
  final FocusNode focusNode;
  final Function(double) onWeightChanged;

  const WeightEntryListTile({
    super.key,
    this.weight,
    required this.onTap,
    required this.focusNode,
    required this.onWeightChanged,
  });

  @override
  ConsumerState createState() => _WeightEntryListTileState();
}

class _WeightEntryListTileState extends ConsumerState<WeightEntryListTile> {
  late TextEditingController weightTextEditingController;
  late String suffix;

  @override
  void initState() {
    super.initState();
    weightTextEditingController = TextEditingController();
    weightTextEditingController.addListener(_handleTextChange);
    suffix = "kg"; // Default suffix
  }

  void _handleTextChange() {
    double? weight;

    weight = double.tryParse(weightTextEditingController.text);

    if (weight == null) return;
    switch (suffix) {
      case "lbs":
        widget.onWeightChanged(weight / 2.2);
        break;
      default:
        widget.onWeightChanged(weight);
        break;
    }
  }

  @override
  void dispose() {
    weightTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    return userDetailsAndPrefsController.when(
      data: (userData) {
        final weightPreference =
            userData?.unitPreferences.weight ?? WeightUnit.kilograms;
        _updateSuffixAndController(weightPreference);

        if (weightPreference == WeightUnit.stones) {
          return StonesEntry(
            onWeightChanged: widget.onWeightChanged,
            weight: widget.weight,
            isListTile: true,
            onTap: widget.onTap,
          );
        }

        return TextFieldTileWithUnits(
          title: "Weight",
          units: suffix,
          focusNode: widget.focusNode,
          textEditingController: weightTextEditingController,
          onTap: widget.onTap,
        );
      },
      error: (_, __) {
        _updateSuffixAndController(WeightUnit.kilograms);
        return TextFieldTileWithUnits(
          title: "Weight",
          units: suffix,
          focusNode: widget.focusNode,
          textEditingController: weightTextEditingController,
          onTap: widget.onTap,
        );
      },
      loading: () => const ShimmerTextFieldTileWithUnits(),
    );
  }

  void _updateSuffixAndController(WeightUnit weightPreference) {
    switch (weightPreference) {
      case WeightUnit.pounds:
        suffix = "lbs";
        break;
      default:
        suffix = "kg";
        break;
    }

    if (widget.weight != null) {
      weightTextEditingController.text =
          _getWeightText(widget.weight!, weightPreference);
    }
  }

  String _getWeightText(double weight, WeightUnit weightPreference) {
    switch (weightPreference) {
      case WeightUnit.pounds:
        return (weight * 2.2).toShortString();
      default:
        return weight.toShortString();
    }
  }
}
