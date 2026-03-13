import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_entry_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_error_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_template_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/exercise_details/exercise_details_body.dart';
import 'package:fitandfitness/src/data/controllers/exercise/exercise_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:fitandfitness/src/routing/exercise_entry_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

enum ExerciseProperties { cardio, strength }

class ExerciseDetailsScreen extends ConsumerStatefulWidget {
  const ExerciseDetailsScreen({super.key});

  @override
  ConsumerState<ExerciseDetailsScreen> createState() =>
      _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends ConsumerState<ExerciseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final exerciseController = ref.watch(exerciseControllerProvider);

    return DetailsTemplateScreen(
      builder: (cupertinoContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Exercise'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  showExerciseActionSheets(
                    cupertinoContext,
                    navigateToCardio: (context) {
                      Navigator.of(context).pop();
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        expand: true,
                        context: cupertinoContext,
                        builder: (context) => ExerciseEntryScreen(
                          cupertinoContext: cupertinoContext,
                          exerciseType: ExerciseType.cardio,
                          fromDetailsPage: true,
                        ),
                      );
                    },
                    navigateToStrength: (context) {
                      Navigator.of(context).pop();
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        expand: true,
                        context: cupertinoContext,
                        builder: (context) => ExerciseEntryScreen(
                          cupertinoContext: cupertinoContext,
                          exerciseType: ExerciseType.strength,
                          fromDetailsPage: true,
                        ),
                      );
                    },
                  );
                },
                tooltip: 'Add',
              )
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: exerciseController.when(
              data: (exerciseEntries) => ExerciseDetailsBody(
                cupertinoContext: cupertinoContext,
                exerciseEntries: exerciseEntries,
              ),
              loading: () => const DetailsShimmerScreen(),
              error: (e, st) => const DetailsErrorScreen(
                entryType: EntryType.exercise,
              ),
            ),
          ),
        );
      },
    );
  }
}
