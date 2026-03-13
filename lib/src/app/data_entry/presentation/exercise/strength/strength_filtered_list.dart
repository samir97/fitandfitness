import 'package:fitandfitness/src/app/data_entry/application/strength_exercise_provider.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_dismissible_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_none_found.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/state/exercise_filters.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/adaptive_loading_indicator.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_strength_controller.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StrengthFilteredList extends ConsumerWidget {
  const StrengthFilteredList({
    super.key,
    required this.cupertinoContext,
  });

  final BuildContext cupertinoContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presetStrengthExercises = ref.read(strengthExerciseProvider);
    final customStrengthController =
        ref.watch(customStrengthControllerProvider);

    final search = ref.watch(exerciseSearch);
    final experienceLevel = ref.watch(experienceLevelFilter);
    final muscleGroup = ref.watch(muscleGroupFilter);
    final motionType = ref.watch(motionTypeFilter);

    return customStrengthController.when(
      data: (customExercises) {
        final allCardioExercises = presetStrengthExercises + customExercises;
        final filteredExercises = allCardioExercises
            .where((exercise) => exercise.name.toLowerCase().contains(search))
            .where((exercise) =>
                experienceLevel.isEmpty ||
                experienceLevel.contains(exercise.experienceLevel))
            .where((exercise) =>
                muscleGroup.isEmpty ||
                muscleGroup.contains(exercise.muscleGroups?.first))
            .where((exercise) =>
                motionType.isEmpty || motionType.contains(exercise.motionType))
            .toList();

        if (filteredExercises.isEmpty) {
          return ExerciseNoneFound(
            query: search,
            cupertinoContext: cupertinoContext,
            exerciseType: ExerciseType.strength,
          );
        }

        return ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: filteredExercises.length,
          itemBuilder: (context, index) {
            if (filteredExercises[index].isPreset) {
              return ListTile(
                title: Text(filteredExercises[index].name),
                onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: cupertinoContext,
                  builder: (_) {
                    return StrengthEntryScreen(
                      strengthExercise: filteredExercises[index],
                    );
                  },
                ),
              );
            } else {
              return ExerciseDismissibleListTile(
                exercise: filteredExercises[index].name,
                bottomSheetTitle:
                    "Remove recent exercise ${filteredExercises[index].name}?",
                onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: cupertinoContext,
                  builder: (_) {
                    return StrengthEntryScreen(
                      strengthExercise: filteredExercises[index],
                    );
                  },
                ),
                onDismissed: () => ref
                    .read(customStrengthControllerProvider.notifier)
                    .deleteEntry(filteredExercises[index].name),
              );
            }
          },
          separatorBuilder: (_, __) => const Divider(),
        );
      },
      error: (_, __) => const Center(
        child: Text("There was an error loading your custom exercises"),
      ),
      loading: () => const Center(
        child: AdaptiveLoadingIndicator(),
      ),
    );
  }
}
