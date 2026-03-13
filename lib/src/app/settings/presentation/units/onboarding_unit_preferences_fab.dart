import 'package:fitandfitness/src/app/settings/presentation/about_you/about_you_onboarding.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingUnitPreferencesFab extends ConsumerWidget {
  const OnboardingUnitPreferencesFab({
    super.key,
    required this.unitPreferences,
  });

  final UnitPreferences unitPreferences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.green,
      onPressed: () {
        ref
            .read(userDetailsAndPrefsControllerProvider.notifier)
            .editUnitPreferences(unitPreferences, isOnboarding: true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AboutYouOnboarding(unitPreferences: unitPreferences),
          ),
        );
      },
      child: Icon(Icons.adaptive.arrow_forward_rounded, color: Colors.white),
    );
  }
}
