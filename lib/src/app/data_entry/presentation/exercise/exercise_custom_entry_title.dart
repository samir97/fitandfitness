import 'package:fitandfitness/src/common_widgets/picker/enum_picker_list_tile.dart';
import 'package:fitandfitness/src/text_input_formatter/trim_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseCustomEntryTitle extends StatelessWidget {
  const ExerciseCustomEntryTitle({
    super.key,
    required this.enumPickerTitle,
    required this.initialEnumSelection,
    required this.options,
    required this.onSelectedEnum,
    required this.textEditingController,
    required this.focusNode,
    this.autoFocus = true,
    required this.unfocusAllTextFields,
  });

  final String enumPickerTitle;
  final String? initialEnumSelection;
  final List<String> options;
  final Function(String?) onSelectedEnum;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final bool autoFocus;
  final VoidCallback unfocusAllTextFields;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          child: ListTile(
            focusColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            onTap: unfocusAllTextFields,
            title: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              enableInteractiveSelection: false,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                hintText: "Exercise name",
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.color
                          ?.withValues(alpha:0.3),
                    ),
              ),
              inputFormatters: <TextInputFormatter>[
                TrimTextInputFormatter(),
              ],
              autofocus: autoFocus,
            ),
          ),
        ),
        EnumPickerListTile(
          title: enumPickerTitle,
          initialSelection: initialEnumSelection,
          options: options,
          onSelectedEnum: onSelectedEnum,
          onTap: unfocusAllTextFields,
        )
      ],
    );
  }
}
