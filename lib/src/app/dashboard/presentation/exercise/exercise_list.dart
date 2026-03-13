import 'package:fitandfitness/src/common_widgets/energy/display/energy_display.dart';
import 'package:fitandfitness/src/common_widgets/weight/display/weight_display.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:flutter/material.dart';

class CardioExerciseList extends StatelessWidget {
  final List<Cardio> exercises;
  final double totalCalories;
  const CardioExerciseList({
    super.key,
    required this.exercises,
    required this.totalCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cardio',
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
              child: EnergyDisplay(totalCalories),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < exercises.length; i++) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  exercises[i].exercise.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '${exercises[i].minutesPerformed} mins',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          if (i != exercises.length - 1) const Divider(),
        ]
      ],
    );
  }
}

class StrengthExerciseList extends StatelessWidget {
  final List<Strength> exercises;

  const StrengthExerciseList({
    super.key,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    final totalWeight = exercises.fold(
        0.0,
        (previous, entry) =>
            previous +
            (entry.weightPerSet ?? 0) *
                entry.numberOfSets *
                entry.repetitionsPerSet);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Strength',
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
              child: WeightDisplay(
                totalWeight,
                isWorkout: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < exercises.length; i++) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  exercises[i].exercise.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '${exercises[i].repetitionsPerSet * exercises[i].numberOfSets} reps',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          if (i != exercises.length - 1) const Divider(),
        ]
      ],
    );
  }
}
