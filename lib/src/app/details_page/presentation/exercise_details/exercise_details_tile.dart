import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/data/controllers/exercise/exercise_controller.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExerciseDetailsTile extends ConsumerWidget {
  const ExerciseDetailsTile({
    super.key,
    required this.cupertinoContext,
    required this.exercise,
  });

  final BuildContext cupertinoContext;
  final ExerciseEntry exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);
    final locale = Localizations.localeOf(context);
    DateFormat dateFormatter = DateFormat.yMMMd(locale.toString());
    DateFormat timeFormatter = DateFormat.Hm(locale.toString());

    return userDetailsAndPrefsController.when(
      data: (userDetailsAndPrefs) {
        return Slidable(
          key: ValueKey(exercise.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            dismissible: DismissiblePane(
              onDismissed: () => ref
                  .read(exerciseControllerProvider.notifier)
                  .deleteEntry(exercise),
            ),
            children: [
              SlidableAction(
                onPressed: (context) => ref
                    .read(exerciseControllerProvider.notifier)
                    .deleteEntry(exercise),
                backgroundColor: CupertinoColors.destructiveRed,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    exercise.exercise.name,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  exercise.summary(),
                ),
              ],
            ),
            subtitle: Text(
                '${dateFormatter.format(exercise.recordedAt)} at ${timeFormatter.format(exercise.recordedAt)}'),
            onTap: () {
              final exerciseEntry = exercise;

              if (exerciseEntry is Strength) {
                CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: cupertinoContext,
                  builder: (context) => StrengthEntryScreen(
                    strength: exerciseEntry,
                  ),
                );
              } else if (exerciseEntry is Cardio) {
                CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  context: cupertinoContext,
                  builder: (context) => CardioEntryScreen(
                    cardio: exerciseEntry,
                  ),
                );
              }
            },
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
