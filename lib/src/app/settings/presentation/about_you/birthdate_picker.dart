import 'package:fitandfitness/src/common_widgets/labeled_value_display.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdatePicker extends StatelessWidget {
  const BirthdatePicker({
    super.key,
    this.birthdate,
  });

  final DateTime? birthdate;

  @override
  Widget build(BuildContext context) {
    return LabeledValueDisplay(
      labelText: "Birthday",
      value: (birthdate == null)
          ? ""
          : DateFormat("dd MMM yyyy").format(birthdate!),
    );
  }
}
