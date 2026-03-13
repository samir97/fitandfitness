import 'package:fitandfitness/src/common_widgets/notes_entry_sheet.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotesListTile extends StatelessWidget {
  final String title;
  final String? body;
  final VoidCallback? onTap;
  final Function(String?) onSave;

  const NotesListTile({
    super.key,
    required this.title,
    this.body,
    this.onTap,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(title),
            trailing: const Icon(Icons.note_add_sharp),
          ),
          if (body != null && body?.trim() != "")
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(body!),
            ),
        ],
      ),
      onTap: () {
        onTap?.call();
        CupertinoScaffold.showCupertinoModalBottomSheet(
          expand: true,
          context: context,
          builder: (context) => NotesEntrySheet(
            title: title,
            initialText: body,
            onSave: onSave,
          ),
        );
      },
    );
  }
}
