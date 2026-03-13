import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExerciseAddNewButton extends StatelessWidget {
  const ExerciseAddNewButton({
    super.key,
    this.query,
    required this.cupertinoContext,
    required this.exerciseType,
  });

  final String? query;
  final BuildContext cupertinoContext;
  final ExerciseType exerciseType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: CupertinoButton(
          child: const Text("Add new exercise"),
          onPressed: () {
            CupertinoScaffold.showCupertinoModalBottomSheet(
              expand: true,
              context: cupertinoContext,
              builder: (context) => (exerciseType == ExerciseType.cardio)
                  ? CardioEntryScreen(
                      query: query,
                    )
                  : StrengthEntryScreen(
                      query: query,
                    ),
            );
          },
        ),
      ),
    );
  }
}
