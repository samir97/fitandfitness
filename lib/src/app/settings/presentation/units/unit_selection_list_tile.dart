import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:flutter/material.dart';

class UnitSelectionListTile<T> extends StatelessWidget {
  const UnitSelectionListTile({
    super.key,
    required this.title,
    required this.value,
    required this.currentPreference,
    required this.updatePreference,
    required this.onUpdate,
  });

  final String title;
  final T value;
  final T currentPreference;
  final UnitPreferences Function(T value) updatePreference;
  final void Function(UnitPreferences updatedPreference) onUpdate;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == currentPreference;

    return ListTile(
      title: Text(title),
      trailing: isSelected ? const Icon(Icons.done_rounded) : null,
      onTap: () {
        onUpdate(updatePreference(value));
      },
    );
  }
}
