import 'package:fitandfitness/src/app/authentication/presentation/version_checker.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/bottom_app_bar/fab_bottom_app_bar.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/bottom_app_bar/floating_action_menu.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/dashboard_screen.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/state/current_overview_date.dart';
import 'package:fitandfitness/src/app/settings/presentation/settings_screen.dart';
import 'package:fitandfitness/src/common_widgets/date_time_picker_bottom_sheet.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/services/url_launcher_service.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, this.title = "FitAndFitness"});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkPrivacyPolicyVersion();
  }

  checkPrivacyPolicyVersion() async {
    final remoteConfig = await ref.watch(firebaseRemoteConfigProvider.future);
    final versionChecker = VersionChecker(remoteConfig: remoteConfig);
    final currentVersion = await versionChecker.privacyPolicy();
    final userVersion = ref
            .read(userDetailsAndPrefsControllerProvider)
            .value
            ?.acceptedTermsVersion ??
        1;

    if (userVersion < currentVersion && mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Updated Terms'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                    "We've updated our Terms of Service and Privacy Policy. To continue, please read and accept the new terms."),
                GestureDetector(
                  onTap: () =>
                      UrlLauncherService.launchTermsAndConditions(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => UrlLauncherService.launchPrivacyPolicy(context),
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ref
                    .read(userDetailsAndPrefsControllerProvider.notifier)
                    .editAcceptedTermsVersion(
                      currentVersion,
                    );
                Navigator.of(context).pop();
              },
              child: const Text('Accept'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    DateFormat formatter = DateFormat.yMMMEd(locale.toString());
    final formattedDate =
        formatter.format(ref.watch(currentOverviewDateProvider).dateTime);

    return Scaffold(
      appBar: (_selectedIndex == 0)
          ? AppBar(
              centerTitle: false,
              title: Text(
                formattedDate,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return DateTimePickerBottomSheet(
                          title: "Overview Date",
                          dateOnly: true,
                          onSave: (dateTime) => ref
                              .read(currentOverviewDateProvider.notifier)
                              .update(dateTime),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.history),
                  tooltip: "History",
                )
              ],
            )
          : AppBar(
              title: const Text("Settings"),
            ),
      body: (_selectedIndex == 0)
          ? const DashboardScreen()
          : const SettingsScreen(),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: const Color(0xFF506478),
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: (int index) => setState(() => _selectedIndex = index),
        items: [
          FABBottomAppBarItem(
            iconData: Icons.today,
            text: 'Dashboard',
          ),
          FABBottomAppBarItem(
            iconData: Icons.tune,
            text: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
