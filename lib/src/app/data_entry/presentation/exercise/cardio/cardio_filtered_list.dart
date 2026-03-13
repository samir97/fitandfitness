import 'package:fitandfitness/src/app/data_entry/application/cardio_exercise_provider.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_dismissible_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_none_found.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/state/exercise_filters.dart';
import 'package:fitandfitness/src/common_widgets/adaptive_loading_indicator.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_cardio_controller.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CardioFilteredList extends ConsumerWidget {
  const CardioFilteredList({
    super.key,
    required this.cupertinoContext,
  });

  final BuildContext cupertinoContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presetCardioExercises = ref.read(cardioExerciseProvider);
    final customCardioController = ref.watch(customCardioControllerProvider);

    final search = ref.watch(exerciseSearch);
    final cardioActivity = ref.watch(cardioActivityFilter);

    return customCardioController.when(
      data: (customExercises) {
        final allCardioExercises = presetCardioExercises + customExercises;

        final filteredExercises = allCardioExercises
            .where((exercise) => exercise.name.toLowerCase().contains(search))
            .where((exercise) =>
                cardioActivity.isEmpty ||
                cardioActivity.contains(exercise.cardioActivity))
            .toList();

        if (filteredExercises.isEmpty) {
          return ExerciseNoneFound(
            query: search,
            cupertinoContext: cupertinoContext,
            exerciseType: ExerciseType.cardio,
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
                    return CardioEntryScreen(
                      cardioExercise: filteredExercises[index],
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
                    return CardioEntryScreen(
                      cardioExercise: filteredExercises[index],
                    );
                  },
                ),
                onDismissed: () => ref
                    .read(customCardioControllerProvider.notifier)
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
