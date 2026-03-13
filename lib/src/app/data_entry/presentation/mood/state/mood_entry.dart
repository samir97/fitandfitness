import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/models/mood/mood_activity.dart';
import 'package:fitandfitness/src/models/mood/mood_level.dart';
import 'package:fitandfitness/src/models/mood/mood_sentiment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mood_entry.g.dart';

@riverpod
class MoodEntry extends _$MoodEntry {
  @override
  Mood build({Mood? mood}) {
    if (mood == null) {
      return Mood(
        recordedAt: DateTime.now(),
        modifiedAt: DateTime.now(),
      );
    }

    return mood;
  }

  void updateMood(MoodLevel moodLevel) {
    state = state.copyWith(moodLevel: moodLevel);
  }

  void addSentiment(MoodSentiment sentiment) {
    state = state.copyWith(
      moodSentiments: {
        ...state.moodSentiments,
        sentiment,
      },
    );
  }

  void removeSentiment(MoodSentiment sentiment) {
    state = state.copyWith(
      moodSentiments: {
        for (final selectedSentiment in state.moodSentiments)
          if (selectedSentiment != sentiment) selectedSentiment,
      },
    );
  }

  void addActivity(MoodActivity activity) {
    state = state.copyWith(
      moodActivities: {
        ...state.moodActivities,
        activity,
      },
    );
  }

  void removeActivity(MoodActivity activity) {
    state = state.copyWith(
      moodActivities: {
        for (final selectedActivity in state.moodActivities)
          if (selectedActivity != activity) selectedActivity,
      },
    );
  }

  void updateRecordedAt(DateTime recordedAt) {
    state = state.copyWith(recordedAt: recordedAt);
  }

  void updateNotes(String? notes) {
    state = state.copyWith(notes: notes);
  }
}
