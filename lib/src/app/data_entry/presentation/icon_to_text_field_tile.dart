import 'package:fitandfitness/src/text_input_formatter/decimal_text_input_formatter.dart';
import 'package:fitandfitness/src/text_input_formatter/limit_range_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconToTextFieldTile extends StatelessWidget {
  final String title;
  final IconData placeholder;
  final bool hidePlaceholder;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final VoidCallback onTap;

  const IconToTextFieldTile({
    super.key,
    required this.title,
    required this.placeholder,
    required this.hidePlaceholder,
    required this.textEditingController,
    required this.focusNode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      title: Row(
        children: [
          Text(title),
          if (hidePlaceholder) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextField(
                  controller: textEditingController,
                  enableInteractiveSelection: false,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    LimitRangeTextInputFormatter(1, 100),
                    FilteringTextInputFormatter.deny(
                      RegExp("^0"),
                    ),
                    DecimalTextInputFormatter(decimalRange: 2),
                  ],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const Text("%")
          ]
        ],
      ),
      trailing: hidePlaceholder ? null : Icon(placeholder),
      onTap: onTap,
      onLongPress: () => focusNode.requestFocus(),
    );
  }
}
