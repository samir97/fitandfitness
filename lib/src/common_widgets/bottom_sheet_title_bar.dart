import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onSave;

  const BottomSheetTitleBar({
    super.key,
    required this.title,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColour = Theme.of(context).textTheme.bodyMedium?.color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          child: Text(
            "Close",
            style: CupertinoTheme.of(context)
                .textTheme
                .actionTextStyle
                .copyWith(color: buttonColour),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        CupertinoButton(
          child: Text(
            "Save",
            style: CupertinoTheme.of(context)
                .textTheme
                .actionTextStyle
                .copyWith(color: buttonColour),
          ),
          onPressed: () {
            onSave();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
