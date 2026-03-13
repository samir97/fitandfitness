import 'package:intl/intl.dart';

extension DoubleToStringExtension on double {
  String toShortString() {
    // Format the double to a string with commas at thousands and two decimal places.
    final formatter = NumberFormat('#,##0.00');

    // Format the double value.
    String formattedString = formatter.format(this);

    // Remove any trailing zeros and the decimal point if not needed.
    if (formattedString.endsWith('.00')) {
      formattedString = formattedString.substring(0, formattedString.length - 3);
    } else if (formattedString.endsWith('0')) {
      formattedString = formattedString.substring(0, formattedString.length - 1);
    }

    return formattedString;
  }
}
