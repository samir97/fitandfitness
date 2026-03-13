import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/models/mood/mood_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/mood_entry.dart';

class MoodSentimentPage extends ConsumerWidget {
  const MoodSentimentPage({super.key, this.mood});

  final Mood? mood;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodEntry = ref.watch(moodEntryProvider(mood: mood));
    final moodEntryNotifier = ref.read(moodEntryProvider(mood: mood).notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "How are you feeling about it?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: [
              for (var sentiment in MoodSentiment.all)
                FilterChip(
                  selectedColor: Colors.red.withValues(alpha:0.1),
                  label: Text("${sentiment.icon} $sentiment"),
                  selected: moodEntry.moodSentiments.contains(sentiment),
                  onSelected: (isSelected) => (isSelected)
                      ? moodEntryNotifier.addSentiment(sentiment)
                      : moodEntryNotifier.removeSentiment(sentiment),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
