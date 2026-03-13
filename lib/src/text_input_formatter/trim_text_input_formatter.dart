import 'package:flutter/services.dart';

class TrimTextInputFormatter extends TextInputFormatter {
  TrimTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String trimmedText = newValue.text.trimLeft();
    if (trimmedText.endsWith("  ")) {
      trimmedText = trimmedText.substring(0, trimmedText.length - 1);
    }

    return TextEditingValue(
      text: trimmedText,
      selection: TextSelection(
        baseOffset: trimmedText.length,
        extentOffset: trimmedText.length,
      ),
      composing: TextRange.empty,
    );
  }
}
