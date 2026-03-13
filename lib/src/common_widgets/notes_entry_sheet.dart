import 'package:fitandfitness/src/common_widgets/bottom_sheet_title_bar.dart';
import 'package:flutter/material.dart';

class NotesEntrySheet extends StatefulWidget {
  final String title;
  final String? initialText;
  final Function(String?) onSave;

  const NotesEntrySheet({
    super.key,
    required this.title,
    required this.initialText,
    required this.onSave,
  });

  @override
  State<NotesEntrySheet> createState() => _NotesEntrySheetState();
}

class _NotesEntrySheetState extends State<NotesEntrySheet> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BottomSheetTitleBar(
            title: widget.title,
            onSave: () {
              final text = _textEditingController.text.trim();

              if (text.isEmpty) {
                widget.onSave(null);
              } else {
                widget.onSave(text);
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                maxLines: null,
                autofocus: true,
                controller: _textEditingController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
