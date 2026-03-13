import 'package:fitandfitness/src/text_input_formatter/decimal_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldTileWithUnits extends StatelessWidget {
  const TextFieldTileWithUnits({
    super.key,
    required this.title,
    this.units,
    this.autoFocus = false,
    this.isDecimal = true,
    this.placeholder,
    this.showSuffix = true,
    required this.textEditingController,
    required this.focusNode,
    required this.onTap,
  });

  final String title;
  final String? units;
  final String? placeholder;
  final bool showSuffix;
  final bool autoFocus;
  final bool isDecimal;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      title: Row(
        children: [
          Text(title),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                autofocus: autoFocus,
                controller: textEditingController,
                focusNode: focusNode,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  hintText: placeholder,
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  if (isDecimal) DecimalTextInputFormatter(decimalRange: 2),
                  if (!isDecimal)
                    FilteringTextInputFormatter.deny(
                      RegExp("^0"),
                    ),
                  if (!isDecimal) FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.numberWithOptions(
                  decimal: isDecimal,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          if (units != null && showSuffix) Text(units!),
        ],
      ),
      onLongPress: () => focusNode.requestFocus(),
      onTap: () {
        onTap();
        focusNode.requestFocus();
      },
    );
  }
}
