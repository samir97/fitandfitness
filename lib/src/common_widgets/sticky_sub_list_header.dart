import 'package:flutter/material.dart';

class StickySubListHeader extends StatelessWidget {
  final String title;

  const StickySubListHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 12,
            bottom: 8,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
