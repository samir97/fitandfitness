import 'package:flutter/services.dart';

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = double.tryParse(newValue.text);

    if (value == null) {
      return newValue;
    }

    if (value < min) {
      return oldValue;
    } else if (value > max) {
      return oldValue;
    }

    return newValue;
  }
}
