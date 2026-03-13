import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/exercise/exercise_list.dart';
import 'package:fitandfitness/src/common_widgets/energy/display/energy_display.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:flutter/material.dart';

class ExerciseWidgetBody extends StatelessWidget {
  final DateTime overviewDate;
  final List<ExerciseEntry> exerciseEntries;

  const ExerciseWidgetBody({
    super.key,
    required this.overviewDate,
    required this.exerciseEntries,
  });

  @override
  Widget build(BuildContext context) {
    final filteredExerciseEntries = exerciseEntries
        .where((entry) => DateUtils.isSameDay(entry.recordedAt, overviewDate))
        .sortedBy((entry) => entry.recordedAt)
        .toList();

    final cardioExercises =
        filteredExerciseEntries.whereType<Cardio>().toList();
    final strengthExercises =
        filteredExerciseEntries.whereType<Strength>().toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cardioExercises.isEmpty && strengthExercises.isEmpty)
            const EmptyExerciseSection(),
          if (cardioExercises.isNotEmpty)
            CardioExerciseList(
              exercises: cardioExercises,
              totalCalories: _calculateTotalCalories(cardioExercises),
            ),
          if (cardioExercises.isNotEmpty && strengthExercises.isNotEmpty)
            const Divider(height: 24),
          if (strengthExercises.isNotEmpty)
            StrengthExerciseList(exercises: strengthExercises),
        ],
      ),
    );
  }

  double _calculateTotalCalories(List<ExerciseEntry> exercises) {
    return exercises.fold(0.0, (previous, entry) {
      if (entry is Cardio) {
        return previous + entry.caloriesBurned;
      } else if (entry is Strength) {
        return previous + (entry.cardio?.caloriesBurned ?? 0);
      }
      return previous;
    });
  }
}

class EmptyExerciseSection extends StatelessWidget {
  const EmptyExerciseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exercise',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            DefaultTextStyle.merge(
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              child: const EnergyDisplay(0),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'No exercises recorded today',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
