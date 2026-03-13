import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_dismissible_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/adaptive_loading_indicator.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_strength_controller.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExerciseRecentList extends ConsumerWidget {
  final BuildContext cupertinoContext;
  final ExerciseType exerciseType;

  const ExerciseRecentList({
    super.key,
    required this.cupertinoContext,
    required this.exerciseType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentExerciseController = (exerciseType == ExerciseType.cardio)
        ? ref.watch(recentCardioControllerProvider)
        : ref.watch(recentStrengthControllerProvider);

    return recentExerciseController.when(
      data: (recentExercises) {
        if (recentExercises.isEmpty) {
          return const Center(
            child: Text("No recent exercises"),
          );
        }

        recentExercises.sort(
          (a, b) {
            if (a.recordedAt == null && b.recordedAt == null) return 0;

            if (a.recordedAt == null) return 1;
            if (b.recordedAt == null) return -1;

            return -a.recordedAt!.compareTo(b.recordedAt!);
          },
        );

        return ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: recentExercises.length,
          itemBuilder: (context, index) => ExerciseDismissibleListTile(
            exercise: recentExercises[index].name,
            bottomSheetTitle:
                "Remove recent exercise ${recentExercises[index].name}?",
            onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
              expand: true,
              context: cupertinoContext,
              builder: (context) {
                if (exerciseType == ExerciseType.cardio) {
                  return CardioEntryScreen(
                    cardioExercise: recentExercises[index] as CardioExercise,
                  );
                } else {
                  return StrengthEntryScreen(
                    strengthExercise:
                        recentExercises[index] as StrengthExercise,
                  );
                }
              },
            ),
            onDismissed: () => (exerciseType == ExerciseType.cardio)
                ? ref
                    .read(recentCardioControllerProvider.notifier)
                    .deleteEntry(recentExercises[index].name)
                : ref
                    .read(recentStrengthControllerProvider.notifier)
                    .deleteEntry(recentExercises[index].name),
          ),
          separatorBuilder: (context, index) => const Divider(),
        );
      },
      error: (_, __) => const Center(
        child: Text("There was an error loading your recent exercises"),
      ),
      loading: () => const Center(
        child: AdaptiveLoadingIndicator(),
      ),
    );
  }
}
