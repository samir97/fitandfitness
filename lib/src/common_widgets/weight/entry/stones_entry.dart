import 'package:fitandfitness/src/common_widgets/labeled_value_display.dart';
import 'package:fitandfitness/src/common_widgets/unit_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class StonesEntry extends StatefulWidget {
  // weight is in kilograms
  final double? weight;
  final bool isListTile;
  final Function? onTap;
  final Function(double) onWeightChanged;

  const StonesEntry(
      {super.key,
      this.weight,
      this.isListTile = false,
      this.onTap,
      required this.onWeightChanged});

  @override
  State<StonesEntry> createState() => _StonesEntryState();
}

class _StonesEntryState extends State<StonesEntry> {
  int stones = 0;
  int? pounds;

  @override
  void initState() {
    super.initState();
    if (widget.weight != null) {
      const double kgToPounds = 2.2;

      double weightInPounds = widget.weight! * kgToPounds;

      stones = weightInPounds ~/ 14;

      pounds = (weightInPounds % 14).round();

      if (pounds == 14) {
        stones += 1;
        pounds = 0;
      }
    }
  }

  String _weightToString() {
    if (stones == 0 || pounds == null) {
      return 'st';
    }
    return '$stones st $pounds lbs';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        showModalBottomSheet(
          context: context,
          builder: (context) => UnitPickerBottomSheet.stonePounds(
            initialLeftValue: stones,
            initialRightValue: pounds,
            onSave: (stones, pounds) {
              setState(() {
                this.stones = stones;
                this.pounds = pounds;
              });
              final weightInPounds = (stones * 14) + pounds;
              final weightInKilograms = weightInPounds / 2.2;
              widget.onWeightChanged(weightInKilograms);
            },
          ),
        );
      },
      child: widget.isListTile
          ? ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Weight'),
                  Text(
                    _weightToString(),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            )
          : LabeledValueDisplay(
              labelText: 'Weight',
              value: _weightToString(),
            ),
    );
  }
}
