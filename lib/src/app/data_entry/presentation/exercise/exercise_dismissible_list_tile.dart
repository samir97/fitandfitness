import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseDismissibleListTile extends StatelessWidget {
  final String exercise;
  final String bottomSheetTitle;
  final VoidCallback onDismissed;
  final VoidCallback onTap;

  const ExerciseDismissibleListTile({
    super.key,
    required this.exercise,
    required this.bottomSheetTitle,
    required this.onDismissed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(exercise),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(
          onDismissed: onDismissed,
        ),
        children: [
          SlidableAction(
            onPressed: (context) => onDismissed(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_outlined,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(exercise),
        onTap: onTap,
        onLongPress: () => showExerciseActionSheets(
          context,
          bottomSheetTitle: bottomSheetTitle,
          deleteExercise: () {
            onDismissed();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

showExerciseActionSheets(
  BuildContext context, {
  required String bottomSheetTitle,
  required VoidCallback deleteExercise,
}) {
  if (Platform.isIOS) {
    _showCupertinoExerciseActionSheet(
      context,
      bottomSheetTitle: bottomSheetTitle,
      deleteExercise: deleteExercise,
    );
  } else {
    _showAndroidExerciseActionSheet(
      context,
      bottomSheetTitle: bottomSheetTitle,
      deleteExercise: deleteExercise,
    );
  }
}

_showAndroidExerciseActionSheet(
  BuildContext context, {
  required String bottomSheetTitle,
  required VoidCallback deleteExercise,
}) =>
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              bottomSheetTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
            title: const Text('Delete'),
            onTap: deleteExercise,
          ),
        ],
      ),
    );

_showCupertinoExerciseActionSheet(
  BuildContext context, {
  required String bottomSheetTitle,
  required VoidCallback deleteExercise,
}) =>
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(bottomSheetTitle),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: deleteExercise,
            child: const Text('Delete'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
