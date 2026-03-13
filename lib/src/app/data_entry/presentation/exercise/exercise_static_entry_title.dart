import 'package:flutter/material.dart';

class ExerciseStaticEntryTitle extends StatelessWidget {
  const ExerciseStaticEntryTitle({
    super.key,
    required this.exerciseName,
    this.category,
    this.motionType,
    this.experienceLevel,
  });

  final String exerciseName;
  final String? category;
  final String? motionType;
  final String? experienceLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            exerciseName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        if (category != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              category!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
        if (motionType != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              "Motion type: ${motionType!}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
        if (experienceLevel != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              "Experience level: ${experienceLevel!}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ],
    );
  }
}
