import 'package:fitandfitness/src/common_widgets/picker/picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EnumPickerListTile extends StatefulWidget {
  const EnumPickerListTile({
    super.key,
    required this.title,
    this.initialSelection,
    required this.onSelectedEnum,
    required this.options,
    required this.onTap,
    this.hasPlaceholder = true,
    this.placeHolderLabel = "Unspecified",
  });

  final String title;
  final String? initialSelection;
  final Function(String?) onSelectedEnum;
  final List<String> options;
  final VoidCallback onTap;
  final bool hasPlaceholder;
  final String placeHolderLabel;

  @override
  State<EnumPickerListTile> createState() => _EnumPickerListTileState();
}

class _EnumPickerListTileState extends State<EnumPickerListTile> {
  String? _selectedEnum;

  @override
  void initState() {
    _selectedEnum = widget.initialSelection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(widget.title),
          ),
          Flexible(
            child: Text(
              (_selectedEnum == null)
                  ? widget.placeHolderLabel
                  : _selectedEnum!,
            ),
          ),
        ],
      ),
      onTap: () {
        widget.onTap();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return PickerBottomSheet(
              title: widget.title,
              initialSelection: _selectedEnum,
              options: widget.options,
              onSelectedEnum: (selectedEnum) => setState(
                () {
                  _selectedEnum = selectedEnum;
                  widget.onSelectedEnum(selectedEnum);
                },
              ),
              hasPlaceholder: widget.hasPlaceholder,
              placeHolderLabel: widget.placeHolderLabel,
            );
          },
        );
      },
    );
  }
}
