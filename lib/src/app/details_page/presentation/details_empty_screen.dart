import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/material.dart';

class DetailsEmptyScreen extends StatelessWidget {
  final EntryType entryType;

  const DetailsEmptyScreen({super.key, required this.entryType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              entryType.icon,
              color: entryType.color,
              size: 75,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Text(
                  entryType.emptyStateMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
