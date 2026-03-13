import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/app/authentication/presentation/version_checker.dart';
import 'package:fitandfitness/src/app/authentication/presentation/error_page.dart';
import 'package:fitandfitness/src/app/authentication/presentation/loading_page.dart';
import 'package:fitandfitness/src/app/home_page.dart';
import 'package:fitandfitness/src/app/settings/presentation/units/unit_preferences_screen.dart';
import 'package:fitandfitness/src/app/settings/presentation/verify_email/verify_email_screen.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  bool? _showEmailVerificationScreen;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkAppVersion());
  }

  @override
  Widget build(BuildContext context) {
    final authStateChanges = ref.watch(authStateChangesProvider);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        child: authStateChanges.when(
          data: (user) {
            if (user == null) {
              return const SignInScreen(
                key: Key('sign_in_screen'),
              );
            }

            if (!user.emailVerified && (_showEmailVerificationScreen ?? true)) {
              return VerifyEmailScreen(
                  key: const Key('verify_email_screen'),
                  onVerified: () =>
                      setState(() => _showEmailVerificationScreen = false));
            }

            final userDetailsAndPrefs =
                ref.watch(userDetailsAndPrefsControllerProvider);

            return userDetailsAndPrefs.when(
              data: (userDetails) {
                if (userDetails == null || userDetails.isOnboarding) {
                  return const UnitPreferencesScreen(
                    key: Key('unit_preferences_screen'),
                  );
                }

                return const MyHomePage(key: Key('home_page'));
              },
              loading: () => const LoadingPage(key: Key('auth_gate_loading')),
              error: (e, __) => const ErrorPage(key: Key('auth_gate_error')),
            );
          },
          loading: () => const LoadingPage(key: Key('auth_gate_loading')),
          error: (_, __) => const ErrorPage(key: Key('auth_gate_error')),
        ),
      ),
    );
  }

  checkAppVersion() async {
    final remoteConfig = await ref.watch(firebaseRemoteConfigProvider.future);
    final versionChecker = VersionChecker(remoteConfig: remoteConfig);
    final (bool isBelowMinimum, String message) = await versionChecker.app();
    if (isBelowMinimum && mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Update Required'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => _launchStore(),
              child: const Text('Update'),
            ),
          ],
        ),
      );
    }
  }

  void _launchStore() async {
    const urlAppStore = 'https://apps.apple.com/app/fitandfitness/id6479725039';
    const urlPlayStore =
        'https://play.google.com/store/apps/details?id=app.fitandfitness.main';

    final url = Platform.isIOS ? urlAppStore : urlPlayStore;
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      Navigator.pop(context);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Update Manually'),
          content: Text(
              'Please open the ${Platform.isIOS ? "App" : "Play"} Store and search for FitAndFitness to update the app.'),
        ),
      );
    }
  }
}
