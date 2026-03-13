import 'package:fitandfitness/src/common_widgets/bottom_sheet_title_bar.dart';
import 'package:flutter/cupertino.dart';

class PickerBottomSheet extends StatefulWidget {
  const PickerBottomSheet({
    super.key,
    required this.title,
    this.initialSelection,
    required this.onSelectedEnum,
    required this.options,
    required this.hasPlaceholder,
    required this.placeHolderLabel,
  });

  final String title;
  final String? initialSelection;
  final Function(String?) onSelectedEnum;
  final List<String> options;
  final bool hasPlaceholder;
  final String placeHolderLabel;

  @override
  State<PickerBottomSheet> createState() => _PickerBottomSheetState();
}

class _PickerBottomSheetState extends State<PickerBottomSheet> {
  late final FixedExtentScrollController _fixedExtentScrollController;
  String? _selectedEnum;

  @override
  void initState() {
    super.initState();
    int? initialSelectionIndex;
    if (widget.initialSelection != null) {
      initialSelectionIndex = widget.options.indexWhere(
        (element) => element == widget.initialSelection,
      );

      if (widget.hasPlaceholder) initialSelectionIndex += 1;

      _selectedEnum = widget.initialSelection;
    }
    _fixedExtentScrollController = FixedExtentScrollController(
      initialItem: initialSelectionIndex ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetTitleBar(
          title: widget.title,
          onSave: () => widget.onSelectedEnum(_selectedEnum),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 32,
            scrollController: _fixedExtentScrollController,
            onSelectedItemChanged: (index) => setState(
              () {
                if (!widget.hasPlaceholder) {
                  _selectedEnum = widget.options[index];
                } else if (index == 0) {
                  _selectedEnum = null;
                } else {
                  _selectedEnum = widget.options[index - 1];
                }
              },
            ),
            children: [
              if (widget.hasPlaceholder) Text(widget.placeHolderLabel),
              for (var option in widget.options)
                Text(
                  option.toString(),
                ),
            ],
          ),
        )
      ],
    );
  }
}
