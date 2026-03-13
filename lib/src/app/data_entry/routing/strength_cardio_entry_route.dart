import 'dart:io';

import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_activity.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const strengthIntensityExercise = {
  "light": CardioExercise(
    name: "Light intensity strength exercise",
    cardioActivity: CardioActivity.conditioningExercise,
    met: 3.5,
  ),
  "moderate": CardioExercise(
    name: "Moderate intensity strength exercise",
    cardioActivity: CardioActivity.conditioningExercise,
    met: 5,
  ),
  "vigorous": CardioExercise(
    name: "Vigorous intensity strength exercise",
    cardioActivity: CardioActivity.conditioningExercise,
    met: 6,
  ),
};

showStrengthCardioEntryActionSheets({
  required BuildContext context,
  required BuildContext cupertinoContext,
  required Function(Cardio? cardio) cardioEntryCallback,
  required bool hasCalories,
}) {
  void addExerciseCalories(CardioExercise cardioExercise) {
    Navigator.pop(cupertinoContext);
    CupertinoScaffold.showCupertinoModalBottomSheet(
      expand: true,
      context: cupertinoContext,
      builder: (context) => CardioEntryScreen(
        cardioExercise: cardioExercise,
        cardioEntryCallback: cardioEntryCallback,
      ),
    );
  }

  void removeExerciseCalories() => cardioEntryCallback(null);

  if (Platform.isIOS) {
    _showCupertinoExerciseActionSheet(
      context: cupertinoContext,
      addExerciseCalories: (cardioExercise) =>
          addExerciseCalories(cardioExercise),
      removeCalories: removeExerciseCalories,
      hasCalories: hasCalories,
    );
  } else {
    _showAndroidExerciseActionSheet(
      context: cupertinoContext,
      addExerciseCalories: (cardioExercise) =>
          addExerciseCalories(cardioExercise),
      removeCalories: removeExerciseCalories,
      hasCalories: hasCalories,
    );
  }
}

_showAndroidExerciseActionSheet({
  required BuildContext context,
  required Function(CardioExercise cardioExercise) addExerciseCalories,
  required VoidCallback removeCalories,
  required bool hasCalories,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              "Strength exercise intensity",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListTile(
            leading: const IntensityIndicator(
              intensity: 1,
            ),
            title: const Text('Light'),
            onTap: () =>
                addExerciseCalories(strengthIntensityExercise['light']!),
          ),
          ListTile(
            leading: const IntensityIndicator(
              intensity: 2,
            ),
            title: const Text('Moderate'),
            onTap: () =>
                addExerciseCalories(strengthIntensityExercise['moderate']!),
          ),
          ListTile(
            leading: const IntensityIndicator(
              intensity: 3,
            ),
            title: const Text('Vigorous'),
            onTap: () =>
                addExerciseCalories(strengthIntensityExercise['vigorous']!),
          ),
          if (hasCalories)
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Icon(
                  Icons.delete_outline,
                ),
              ),
              title: const Text('Remove Calories'),
              onTap: () {
                Navigator.of(context).pop();
                removeCalories();
              },
            ),
        ],
      );
    },
  );
}

_showCupertinoExerciseActionSheet({
  required BuildContext context,
  required Function(CardioExercise cardioExercise) addExerciseCalories,
  required VoidCallback removeCalories,
  required bool hasCalories,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Strength Exercise Intensity'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: const Text('Light'),
          onPressed: () =>
              addExerciseCalories(strengthIntensityExercise['light']!),
        ),
        CupertinoActionSheetAction(
          child: const Text('Moderate'),
          onPressed: () =>
              addExerciseCalories(strengthIntensityExercise['moderate']!),
        ),
        CupertinoActionSheetAction(
          child: const Text('Vigorous'),
          onPressed: () =>
              addExerciseCalories(strengthIntensityExercise['vigorous']!),
        ),
        if (hasCalories)
          CupertinoActionSheetAction(
            child: const Text(
              'Remove Calories',
              style: TextStyle(color: CupertinoColors.destructiveRed),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              removeCalories();
            },
          ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}

class IntensityIndicator extends StatelessWidget {
  const IntensityIndicator({
    super.key,
    required this.intensity,
  });

  final int intensity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.local_fire_department_rounded,
          color: Colors.deepOrange,
        ),
        Icon(
          (intensity == 2 || intensity == 3)
              ? Icons.local_fire_department_rounded
              : Icons.local_fire_department_outlined,
          color: (intensity == 2 || intensity == 3)
              ? Colors.deepOrange
              : Colors.deepOrangeAccent.shade200,
        ),
        Icon(
          (intensity == 3)
              ? Icons.local_fire_department_rounded
              : Icons.local_fire_department_outlined,
          color: (intensity == 3)
              ? Colors.deepOrange
              : Colors.deepOrangeAccent.shade200,
        ),
      ],
    );
  }
}
