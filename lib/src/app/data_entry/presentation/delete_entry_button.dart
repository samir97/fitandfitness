import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteEntryButton extends StatelessWidget {
  const DeleteEntryButton({
    super.key,
    required this.onDelete,
    this.shouldNavigateBack = true,
  });

  final VoidCallback onDelete;
  final bool shouldNavigateBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (shouldNavigateBack) {
            showDialog(
              context: context,
              builder: (context) {
                return DeleteEntryAlertDialog(
                  onDelete: onDelete,
                );
              },
            );
          } else {
            onDelete();
          }
        },
        child: const Text(
          'Delete Entry',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}

class DeleteEntryAlertDialog extends StatelessWidget {
  const DeleteEntryAlertDialog({
    super.key,
    required this.onDelete,
  });

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Entry"),
      content:
          const Text("Are you sure you want to permanently delete this entry?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
