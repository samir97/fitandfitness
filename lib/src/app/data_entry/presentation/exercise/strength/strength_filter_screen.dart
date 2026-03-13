import 'package:fitandfitness/src/app/data_entry/presentation/exercise/state/exercise_filters.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/models/exercise/strength/experience_level.dart';
import 'package:fitandfitness/src/models/exercise/strength/motion_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/muscle_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrengthFilterScreen extends ConsumerStatefulWidget {
  const StrengthFilterScreen({
    super.key,
  });

  @override
  ConsumerState<StrengthFilterScreen> createState() =>
      _StrengthFilterScreenState();
}

class _StrengthFilterScreenState extends ConsumerState<StrengthFilterScreen> {
  late Set<ExperienceLevel> experienceLevelFilters;
  late Set<MuscleGroup> muscleGroupFilters;
  late Set<MotionType> motionTypeFilters;

  @override
  void initState() {
    experienceLevelFilters = ref.read(experienceLevelFilter);
    muscleGroupFilters = ref.read(muscleGroupFilter);
    motionTypeFilters = ref.read(motionTypeFilter);

    super.initState();
  }

  void toggleExperienceLevel({
    required bool isSelected,
    required ExperienceLevel experienceLevel,
  }) =>
      setState(
        () => isSelected
            ? experienceLevelFilters = {
                ...experienceLevelFilters,
                experienceLevel,
              }
            : experienceLevelFilters = {
                for (var filter in experienceLevelFilters)
                  if (experienceLevel != filter) filter
              },
      );

  void toggleMuscleGroup({
    required bool isSelected,
    required MuscleGroup muscleGroup,
  }) =>
      setState(
        () => isSelected
            ? muscleGroupFilters = {
                ...muscleGroupFilters,
                muscleGroup,
              }
            : muscleGroupFilters = {
                for (var filter in muscleGroupFilters)
                  if (muscleGroup != filter) filter
              },
      );

  void toggleMotionType({
    required bool isSelected,
    required MotionType motionType,
  }) =>
      setState(
        () => isSelected
            ? motionTypeFilters = {
                ...motionTypeFilters,
                motionType,
              }
            : motionTypeFilters = {
                for (var filter in motionTypeFilters)
                  if (motionType != filter) filter
              },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateEntryScreen(
        title: "Filter Activities",
        showBackButton: true,
        onSubmit: () {
          ref.read(experienceLevelFilter.notifier).state =
              experienceLevelFilters;
          ref.read(muscleGroupFilter.notifier).state = muscleGroupFilters;
          ref.read(motionTypeFilter.notifier).state = motionTypeFilters;
          Navigator.of(context).pop();
        },
        bodyWidgets: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Motion Type",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: MotionType.values
                  .map(
                    (motionType) => FilterChip(
                      selected: motionTypeFilters.contains(motionType),
                      selectedColor: Colors.yellow.withValues(alpha:0.3),
                      label: Text(motionType.toString()),
                      onSelected: (bool isSelected) => toggleMotionType(
                        isSelected: isSelected,
                        motionType: motionType,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Muscle Group",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: MuscleGroup.values
                  .map(
                    (muscleGroup) => FilterChip(
                      selected: muscleGroupFilters.contains(muscleGroup),
                      selectedColor: Colors.yellow.withValues(alpha:0.3),
                      label: Text(muscleGroup.toString()),
                      onSelected: (bool isSelected) => toggleMuscleGroup(
                        isSelected: isSelected,
                        muscleGroup: muscleGroup,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Experience Level",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: ExperienceLevel.values
                  .map(
                    (experienceLevel) => FilterChip(
                      selected:
                          experienceLevelFilters.contains(experienceLevel),
                      selectedColor: Colors.yellow.withValues(alpha:0.3),
                      label: Text(experienceLevel.toString()),
                      onSelected: (bool isSelected) => toggleExperienceLevel(
                        isSelected: isSelected,
                        experienceLevel: experienceLevel,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
        bottomNavigationBar: SafeArea(
          top: false,
          child: CupertinoButton(
            child: Text(
              "Clear all",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            onPressed: () {
              ref.read(experienceLevelFilter.notifier).state = {};
              ref.read(muscleGroupFilter.notifier).state = {};
              ref.read(motionTypeFilter.notifier).state = {};
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
