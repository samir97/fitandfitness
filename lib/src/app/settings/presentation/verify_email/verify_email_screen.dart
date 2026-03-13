import 'dart:async';

import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/app/settings/presentation/dialogs/sign_out_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  final VoidCallback onVerified;

  const VerifyEmailScreen({
    super.key,
    required this.onVerified,
  });

  @override
  ConsumerState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  bool _isReloadingUser = false;
  late Timer _debounceTimer;
  static const int debounceDurationInSeconds = 180;

  @override
  void initState() {
    super.initState();
    _sendVerificationEmail();
    _debounceTimer =
        Timer(const Duration(seconds: debounceDurationInSeconds), () {});
  }

  @override
  void dispose() {
    _debounceTimer.cancel();
    super.dispose();
  }

  void _onResendEmailPressed() {
    if (_debounceTimer.isActive) return;
    _sendVerificationEmail();
    _debounceTimer =
        Timer(const Duration(seconds: debounceDurationInSeconds), () {});
  }

  void _sendVerificationEmail() {
    final authRepository = ref.read(authRepositoryProvider);
    authRepository.currentUser?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16),
                  Icon(
                    Icons.email_outlined,
                    size: 75,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "• A verification email has been sent.\n• Please check your inbox or spam folder.\n• Click on the verification link.\n• Return to app to continue.",
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                          onPressed: _isReloadingUser
                              ? null
                              : () async {
                                  setState(() {
                                    _isReloadingUser = true;
                                  });

                                  final authRepository =
                                      ref.read(authRepositoryProvider);

                                  await authRepository.currentUser?.reload();

                                  final isEmailVerified =
                                      authRepository.currentUser?.emailVerified;

                                  if (isEmailVerified == true) {
                                    widget.onVerified();
                                  }

                                  if (isEmailVerified == false &&
                                      context.mounted) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: const Text(
                                                  "Email Not Verified"),
                                              content: const Text(
                                                  "Check your email, click the verification link, then return and press continue."),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text("OK"),
                                                ),
                                              ],
                                            ));
                                  }

                                  setState(() {
                                    _isReloadingUser = false;
                                  });
                                },
                          child: _isReloadingUser
                              ? const CupertinoActivityIndicator()
                              : const Text("Continue")),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text('Verification email sent.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _onResendEmailPressed();
                    },
                    child: const Text("Resend Email"),
                  ),
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const SignOutAlertDialog(),
                    ),
                    child: const Text("Sign Out"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
