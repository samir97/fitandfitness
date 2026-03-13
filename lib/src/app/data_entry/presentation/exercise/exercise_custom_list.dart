import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_add_new_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_dismissible_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_strength_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_strength_controller.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExerciseCustomList extends ConsumerWidget {
  final ExerciseType exerciseType;

  const ExerciseCustomList({
    super.key,
    required this.cupertinoContext,
    required this.exerciseType,
  });

  final BuildContext cupertinoContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customExerciseController = (exerciseType == ExerciseType.cardio)
        ? ref.watch(customCardioControllerProvider)
        : ref.watch(customStrengthControllerProvider);

    return Column(
      children: [
        Expanded(
          child: customExerciseController.when(
            data: (customExercises) {
              if (customExercises.isEmpty) {
                return const Center(
                  child: Text("No custom exercises"),
                );
              }

              customExercises.sort((a, b) => a.name.compareTo(b.name));

              return ListView.separated(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: customExercises.length,
                itemBuilder: (context, index) => ExerciseDismissibleListTile(
                  exercise: customExercises[index].name,
                  bottomSheetTitle:
                      "Delete custom exercise ${customExercises[index].name}?",
                  onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: cupertinoContext,
                    builder: (context) {
                      if (exerciseType == ExerciseType.cardio) {
                        return CardioEntryScreen(
                          cardioExercise:
                              customExercises[index] as CardioExercise,
                        );
                      } else {
                        return StrengthEntryScreen(
                          strengthExercise:
                              customExercises[index] as StrengthExercise,
                        );
                      }
                    },
                  ),
                  onDismissed: () {
                    if (exerciseType == ExerciseType.cardio) {
                      ref
                          .read(customCardioControllerProvider.notifier)
                          .deleteEntry(customExercises[index].name);
                      ref
                          .read(recentCardioControllerProvider.notifier)
                          .deleteEntry(customExercises[index].name);
                    } else {
                      ref
                          .read(customStrengthControllerProvider.notifier)
                          .deleteEntry(customExercises[index].name);
                      ref
                          .read(recentStrengthControllerProvider.notifier)
                          .deleteEntry(customExercises[index].name);
                    }
                  },
                ),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            },
            error: (_, __) => const Center(
              child: Text("There was an error loading your custom exercises"),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        ExerciseAddNewButton(
          cupertinoContext: cupertinoContext,
          exerciseType: exerciseType,
        ),
      ],
    );
  }
}
