import 'package:fitandfitness/src/text_input_formatter/decimal_text_input_formatter.dart';
import 'package:flutter/material.dart';

class PermanentPrefixTextField extends StatefulWidget {
  const PermanentPrefixTextField({
    super.key,
    required this.prefix,
    required this.suffix,
    required this.textEditingController,
    required this.focusNode,
    this.overrideText,
    this.onTap,
  });

  final String prefix;
  final String suffix;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String? overrideText;
  final Function? onTap;

  @override
  State<PermanentPrefixTextField> createState() =>
      _PermanentPrefixTextFieldState();
}

class _PermanentPrefixTextFieldState extends State<PermanentPrefixTextField> {
  late Color _borderColor;
  late double _borderSize;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(
      () {
        setState(
          () {
            if (widget.focusNode.hasFocus) {
              _borderSize = 2;
              _borderColor = Colors.blue;
            } else {
              _borderSize = 1;
              _borderColor = (Theme.of(context).brightness == Brightness.light)
                  ? Colors.black38
                  : Colors.white38;
            }
          },
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _borderSize = 1;
    _borderColor = (Theme.of(context).brightness == Brightness.light)
        ? Colors.black38
        : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.onTap == null)
          ? () => widget.focusNode.requestFocus()
          : () => widget.onTap?.call(),
      onLongPress: widget.focusNode.requestFocus,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(width: _borderSize, color: _borderColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.prefix,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: (widget.overrideText == null)
                  ? SuffixTextField(
                      suffix: widget.suffix,
                      focusNode: widget.focusNode,
                      textEditingController: widget.textEditingController,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        widget.overrideText!,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuffixTextField extends StatelessWidget {
  const SuffixTextField({
    super.key,
    required this.suffix,
    required this.focusNode,
    required this.textEditingController,
  });

  final String suffix;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: focusNode,
            controller: textEditingController,
            enableInteractiveSelection: false,
            autocorrect: false,
            textAlign: TextAlign.right,
            inputFormatters: [
              DecimalTextInputFormatter(
                decimalRange: 2,
              ),
            ],
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Text(
          suffix,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
