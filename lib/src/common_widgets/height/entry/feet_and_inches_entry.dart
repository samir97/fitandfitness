import 'package:fitandfitness/src/common_widgets/labeled_value_display.dart';
import 'package:fitandfitness/src/common_widgets/unit_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class FeetAndInchesEntry extends StatefulWidget {
  // height is in centimeters
  final double? initialHeight;
  final VoidCallback? onTap;
  final Function(double) onHeightChanged;

  const FeetAndInchesEntry(
      {super.key,
      this.initialHeight,
      this.onTap,
      required this.onHeightChanged});

  @override
  State<FeetAndInchesEntry> createState() => _FeetAndInchesEntryState();
}

class _FeetAndInchesEntryState extends State<FeetAndInchesEntry> {
  int? feet;
  int? inches;

  @override
  void initState() {
    super.initState();
    if (widget.initialHeight != null) {
      final heightInInches = widget.initialHeight! / 2.54;
      feet = heightInInches ~/ 12;
      inches = (heightInInches % 12).ceil();
    }
  }

  String _heightToString() {
    if (feet == null || inches == null) {
      return 'ft';
    }
    return '$feet ft $inches in';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        showModalBottomSheet(
          context: context,
          builder: (context) => UnitPickerBottomSheet.feetInches(
            initialLeftValue: feet,
            initialRightValue: inches,
            onSave: (feet, inches) {
              setState(() {
                this.feet = feet;
                this.inches = inches;
              });
              final heightInInches = (feet * 12) + inches;
              final heightInCentimeters = heightInInches * 2.54;
              widget.onHeightChanged(heightInCentimeters);
            },
          ),
        );
      },
      child: LabeledValueDisplay(
        labelText: 'Height',
        value: _heightToString(),
      ),
    );
  }
}
