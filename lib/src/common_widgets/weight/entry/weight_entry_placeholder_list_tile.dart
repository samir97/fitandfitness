import 'package:fitandfitness/src/app/data_entry/presentation/shimmer_text_field_tile_with_units.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/text_field_tile_with_units.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:flutter/material.dart';

class WeightEntryPlaceholderListTile extends StatefulWidget {
  final double? weight;
  final WeightUnit? weightUnit;
  final VoidCallback onTap;
  final FocusNode focusNode;
  final Function(double?) onWeightChanged;

  const WeightEntryPlaceholderListTile(
      {super.key,
      this.weight,
      this.weightUnit,
      required this.onTap,
      required this.focusNode,
      required this.onWeightChanged});

  @override
  State<WeightEntryPlaceholderListTile> createState() =>
      _WeightEntryPlaceholderListTileState();
}

class _WeightEntryPlaceholderListTileState
    extends State<WeightEntryPlaceholderListTile> {
  late TextEditingController weightTextEditingController;
  late bool showSuffix;

  @override
  void initState() {
    super.initState();
    double? initialWeight = widget.weight;

    showSuffix = (initialWeight != null);

    if (widget.weightUnit == WeightUnit.pounds && initialWeight != null) {
      initialWeight *= 2.2;
    }

    weightTextEditingController = TextEditingController()
      ..text = initialWeight?.toShortString() ?? '';
    weightTextEditingController.addListener(_handleTextChange);
    widget.focusNode.addListener(_handleFocusChange);
  }

  void _handleTextChange() {
    final weight = double.tryParse(weightTextEditingController.text);
    if (weight == null) {
      widget.onWeightChanged(null);
      return;
    }

    widget.onWeightChanged(_convertWeightBack(weight));
  }

  double _convertWeightBack(double weight) {
    if (widget.weightUnit == WeightUnit.pounds) {
      return weight / 2.2;
    }
    return weight;
  }

  void _handleFocusChange() => setState(() => showSuffix =
      widget.focusNode.hasFocus || weightTextEditingController.text.isNotEmpty);

  @override
  void dispose() {
    weightTextEditingController.dispose();
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.weightUnit == null) return const ShimmerTextFieldTileWithUnits();

    return TextFieldTileWithUnits(
      title: "Weight per Set",
      units: widget.weightUnit.toString(),
      focusNode: widget.focusNode,
      textEditingController: weightTextEditingController,
      placeholder: showSuffix ? null : "Optional",
      showSuffix: showSuffix,
      onTap: widget.onTap,
    );
  }
}
