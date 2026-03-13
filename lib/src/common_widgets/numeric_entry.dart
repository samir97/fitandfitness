import 'package:fitandfitness/src/common_widgets/permanent_prefix_text_field.dart';
import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:flutter/material.dart';

class NumericEntry extends StatefulWidget {
  const NumericEntry(
      {super.key,
      required this.prefix,
      required this.suffix,
      this.initialValue,
      required this.focusNode,
      required this.onValueChanged});

  final String prefix;
  final String suffix;
  final double? initialValue;
  final FocusNode focusNode;
  final Function(double?) onValueChanged;

  @override
  State<NumericEntry> createState() => _NumericEntryState();
}

class _NumericEntryState extends State<NumericEntry> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController()
      ..text = widget.initialValue?.toShortString() ?? "";
    textEditingController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onTextChange);
    textEditingController.dispose();
    super.dispose();
  }

  void _onTextChange() {
    final double? height = double.tryParse(textEditingController.text);

    widget.onValueChanged(height);
  }

  @override
  Widget build(BuildContext context) {
    return PermanentPrefixTextField(
      prefix: widget.prefix,
      suffix: widget.suffix,
      textEditingController: textEditingController,
      focusNode: widget.focusNode,
    );
  }
}
