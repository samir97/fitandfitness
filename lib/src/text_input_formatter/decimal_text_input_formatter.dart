import 'dart:math' as math;

import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange == null) return newValue;

    String newText = newValue.text;
    double? newDouble = double.tryParse(newText);

    if (newText.isNotEmpty && newDouble == null) {
      return oldValue;
    }

    if (newText.contains(".") &&
        newText.substring(newText.indexOf(".") + 1).length > decimalRange!) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (newText == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(
          truncated.length,
          truncated.length + 1,
        ),
        extentOffset: math.min(
          truncated.length,
          truncated.length + 1,
        ),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
