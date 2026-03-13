import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TemplateEntryScreen extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final CrossAxisAlignment crossAxisAlignment;
  final VoidCallback? onSubmit;
  final List<Widget> bodyWidgets;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const TemplateEntryScreen({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.onSubmit,
    required this.bodyWidgets,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: (showBackButton)
                    ? Icon(Icons.adaptive.arrow_back_rounded)
                    : const Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(title),
              actions: [
                if (onSubmit != null)
                  IconButton(
                    icon: const Icon(Icons.done_rounded),
                    onPressed: () => onSubmit?.call(),
                  )
              ],
            ),
            body: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const SizedBox(
                  height: 16,
                ),
                ...bodyWidgets,
              ],
            ),
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
          );
        },
      ),
    );
  }
}
