import 'dart:math';

import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/app/settings/presentation/delete_account/delete_account_screen.dart';
import 'package:fitandfitness/src/app/settings/presentation/dialogs/sign_out_alert_dialog.dart';
import 'package:fitandfitness/src/app/settings/presentation/units/unit_preferences_screen.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/services/url_launcher_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'about_you/about_you_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    final userDetailsAndPrefsController = ref.watch(
      userDetailsAndPrefsControllerProvider,
    );
    final weightController = ref.watch(weightControllerProvider);

    void showProfileErrorDialog() => showDialog(
          context: context,
          builder: (BuildContext context) => const EntryAlertDialog(
            title: "Error loading your profile",
            body:
                "Please try restarting the app. If the problem persists log out and log back in.",
          ),
        );

    return ListView(
      children: [
        ListTile(
          title: const Text("About You"),
          onTap: () {
            final userDetailsAndPrefs = userDetailsAndPrefsController.value;
            final lastWeight = weightController.value?.first;

            if (userDetailsAndPrefs == null || lastWeight == null) {
              return showProfileErrorDialog();
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AboutYouScreen(
                  userDetailsAndPrefs: userDetailsAndPrefs,
                  lastWeight: lastWeight,
                ),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          title: const Text("Unit Preferences"),
          onTap: () {
            final userDetailsAndPrefs = userDetailsAndPrefsController.value;

            if (userDetailsAndPrefs == null) return showProfileErrorDialog();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UnitPreferencesScreen(
                  unitPreferences: userDetailsAndPrefs.unitPreferences,
                ),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          title: const Text("Privacy Policy"),
          onTap: () => UrlLauncherService.launchPrivacyPolicy(context),
        ),
        const Divider(),
        ListTile(
          title: const Text("Terms And Conditions"),
          onTap: () => UrlLauncherService.launchTermsAndConditions(context),
        ),
        const Divider(),
        ListTile(
          title: const Text("Licences"),
          onTap: () => showLicensePage(context: context),
        ),
        const Divider(),
        ListTile(
          title: const Text("Contact Us"),
          onTap: () => UrlLauncherService.launchContactUs(context),
        ),
        const Divider(),
        ListTile(
          title: const Text("Sign Out"),
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => const SignOutAlertDialog(),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text("Delete Account"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DeleteAccountScreen(),
              ),
            );
          },
        ),
        const Divider(),
        SizedBox(
          height: max(0, bottomPadding - 32),
        )
      ],
    );
  }
}
