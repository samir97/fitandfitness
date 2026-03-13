import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum EntryType {
  water,
  mood,
  weight,
  exercise,
  sleep;

  IconData get icon {
    switch (this) {
      case EntryType.water:
        return MdiIcons.cup;
      case EntryType.mood:
        return MdiIcons.emoticonOutline;
      case EntryType.weight:
        return MdiIcons.scaleBathroom;
      case EntryType.exercise:
        return MdiIcons.dumbbell;
      case EntryType.sleep:
        return Icons.bedtime;
    }
  }

  Color get color {
    switch (this) {
      case EntryType.water:
        return Colors.blue;
      case EntryType.mood:
        return Colors.red.shade400;
      case EntryType.weight:
        return Colors.grey;
      case EntryType.exercise:
        return Colors.yellow.shade900;
      case EntryType.sleep:
        return Colors.purple;
    }
  }

  String get emptyStateMessage {
    switch (this) {
      case EntryType.water:
        return 'Add your first water entry and start tracking your hydration progress!';
      case EntryType.mood:
        return 'Add your first mood entry and start tracking your emotional well-being!';
      case EntryType.weight:
        return 'Add your first weight entry  and start monitoring your weight goals!';
      case EntryType.exercise:
        return 'Add your first exercise entry and start tracking your fitness journey!';
      case EntryType.sleep:
        return 'Add your first sleep entry and start tracking your sleep habits!';
    }
  }

  String get errorStateMessage {
    return 'There was an error loading your #entryType entries. Please try again later.'
        .replaceAll('#entryType', name);
  }
}
