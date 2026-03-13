import 'package:fitandfitness/src/app/data_entry/presentation/mood/state/mood_entry.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/models/mood/mood_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodActivityPage extends ConsumerWidget {
  const MoodActivityPage({
    super.key,
    this.mood,
  });

  final Mood? mood;

  String getTimeOfDayGreeting(DateTime dateTime) {
    var hour = dateTime.hour;
    if (hour < 12) {
      return 'morning';
    } else if (hour < 17) {
      return 'afternoon';
    } else {
      return 'evening';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodEntry = ref.watch(moodEntryProvider(mood: mood));
    final moodEntryNotifier = ref.read(moodEntryProvider(mood: mood).notifier);
    final timeOfDay = getTimeOfDayGreeting(moodEntry.recordedAt);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'What makes your $timeOfDay ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <TextSpan>[
                TextSpan(
                  text: moodEntry.moodLevel.label.toLowerCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '?'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            alignment: WrapAlignment.center,
            children: [
              for (var activity in MoodActivity.all)
                FilterChip(
                  label: Text("${activity.icon} $activity"),
                  selected: moodEntry.moodActivities.contains(activity),
                  selectedColor: Colors.red.withValues(alpha:0.1),
                  onSelected: (hasSelected) => (hasSelected)
                      ? moodEntryNotifier.addActivity(activity)
                      : moodEntryNotifier.removeActivity(activity),
                ),
            ],
          ),
        )
      ],
    );
  }
}
