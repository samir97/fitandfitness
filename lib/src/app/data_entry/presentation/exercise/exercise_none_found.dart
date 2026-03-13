import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_add_new_button.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/material.dart';

class ExerciseNoneFound extends StatelessWidget {
  const ExerciseNoneFound({
    super.key,
    required this.query,
    required this.cupertinoContext,
    required this.exerciseType,
  });

  final String query;
  final BuildContext cupertinoContext;
  final ExerciseType exerciseType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        const Center(child: Text("No exercises found")),
        const Spacer(),
        ExerciseAddNewButton(
          query: query,
          cupertinoContext: cupertinoContext,
          exerciseType: exerciseType,
        )
      ],
    );
  }
}
