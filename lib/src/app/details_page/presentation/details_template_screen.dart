import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DetailsTemplateScreen extends StatelessWidget {
  const DetailsTemplateScreen({super.key, required this.builder});

  final Widget Function(BuildContext cupertinoContext) builder;

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: Builder(
          builder: builder,
        ),
      ),
    );
  }
}
