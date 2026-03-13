import 'package:fitandfitness/src/data/controllers/exercise/exercise_controller.dart';
import 'package:fitandfitness/src/data/controllers/mood_controller.dart';
import 'package:fitandfitness/src/data/controllers/sleep_controller.dart';
import 'package:fitandfitness/src/data/controllers/water_controller.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsErrorScreen extends ConsumerWidget {
  final EntryType entryType;

  const DetailsErrorScreen({
    super.key,
    required this.entryType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              entryType.icon,
              color: Colors.grey.shade400,
              size: 75,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Text(
                  entryType.errorStateMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  switch (entryType) {
                    case EntryType.water:
                      ref.read(waterControllerProvider.notifier).refresh();
                      break;
                    case EntryType.mood:
                      ref.read(moodControllerProvider.notifier).refresh();
                      break;
                    case EntryType.weight:
                      ref.read(weightControllerProvider.notifier).refresh();
                      break;
                    case EntryType.exercise:
                      ref.read(exerciseControllerProvider.notifier).refresh();
                      break;
                    case EntryType.sleep:
                      ref.read(sleepControllerProvider.notifier).refresh();
                      break;
                  }
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
