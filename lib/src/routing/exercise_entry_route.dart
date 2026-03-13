import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

showExerciseActionSheets(
  BuildContext context, {
  required Function(BuildContext context) navigateToCardio,
  required Function(BuildContext context) navigateToStrength,
}) {
  if (Platform.isIOS) {
    _showCupertinoExerciseActionSheet(
      context,
      navigateToCardio: navigateToCardio,
      navigateToStrength: navigateToStrength,
    );
  } else {
    _showAndroidExerciseActionSheet(
      context,
      navigateToCardio: navigateToCardio,
      navigateToStrength: navigateToStrength,
    );
  }
}

_showAndroidExerciseActionSheet(
  BuildContext context, {
  required Function(BuildContext context) navigateToCardio,
  required Function(BuildContext context) navigateToStrength,
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
              "Exercise type",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            title: const Text('Cardio'),
            onTap: () => navigateToCardio(context),
          ),
          ListTile(
            leading: Icon(
              MdiIcons.dumbbell,
              color: Colors.black,
            ),
            title: const Text('Strength'),
            onTap: () => navigateToStrength(context),
          ),
        ],
      );
    },
  );
}

_showCupertinoExerciseActionSheet(
  BuildContext context, {
  required Function(BuildContext context) navigateToCardio,
  required Function(BuildContext context) navigateToStrength,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Add Exercise'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: const Text('Cardio'),
          onPressed: () => navigateToCardio(context),
        ),
        CupertinoActionSheetAction(
            child: const Text('Strength'),
            onPressed: () => navigateToStrength(context)),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  );
}
