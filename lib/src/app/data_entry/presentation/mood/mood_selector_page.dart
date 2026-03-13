import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/models/mood/mood_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/mood_entry.dart';

class MoodSelectorPage extends ConsumerStatefulWidget {
  const MoodSelectorPage({
    super.key,
    this.mood,
  });

  final Mood? mood;

  @override
  ConsumerState<MoodSelectorPage> createState() => _MoodSelectorPageState();
}

class _MoodSelectorPageState extends ConsumerState<MoodSelectorPage> {
  @override
  Widget build(BuildContext context) {
    final moodEntry = ref.watch(moodEntryProvider(mood: widget.mood));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "How are you feeling today?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            moodEntry.moodLevel.label,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Slider(
          min: 0,
          max: 4,
          divisions: 4,
          value: moodEntry.moodLevel.index.toDouble(),
          activeColor: Colors.red,
          inactiveColor: Colors.red.withValues(alpha:0.2),
          onChanged: (value) {
            final moodEntryNotifier =
                ref.read(moodEntryProvider(mood: widget.mood).notifier);
            if (value == 0) {
              moodEntryNotifier.updateMood(MoodLevel.veryBad);
            }
            if (value == 1) moodEntryNotifier.updateMood(MoodLevel.bad);
            if (value == 2) moodEntryNotifier.updateMood(MoodLevel.normal);
            if (value == 3) moodEntryNotifier.updateMood(MoodLevel.good);
            if (value == 4) {
              moodEntryNotifier.updateMood(MoodLevel.veryGood);
            }
          },
        ),
      ],
    );
  }
}
