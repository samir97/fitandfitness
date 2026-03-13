import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:fitandfitness/src/firebase/firebase_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReauthenticateScreen extends ConsumerWidget {
  final User user;

  const ReauthenticateScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> providerIds =
        user.providerData.map((provider) => provider.providerId).toList();
    final hasAppleProvider = providerIds.contains(AuthProviderIds.apple);

    if (providerIds.isEmpty) user.delete();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reauthenticate'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
                'Before we can delete your account, we need to verify your identity for security purposes.'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Text(
                'This is essential to protect your personal data and prevent unauthorised deletion.'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Please sign in to complete the reauthentication process. Your account will be deleted shortly afterwards.',
            ),
          ),
          const SizedBox(height: 16.0),
          hasAppleProvider
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: AppleReauthenticateButton(user),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ReauthenticateView(
                    onSignedIn: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      user.delete();
                    },
                    providers:
                        AuthProviderConfigurator.getAuthProviders(providerIds),
                  ),
                ),
        ],
      ),
    );
  }
}

class AppleReauthenticateButton extends ConsumerWidget {
  final User user;

  const AppleReauthenticateButton(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        try {
          final userCred =
              await user.reauthenticateWithProvider(AppleAuthProvider());
          final authorizationCode =
              userCred.additionalUserInfo?.authorizationCode;

          if (authorizationCode == null) {
            throw Exception('Authorization code not found');
          }

          await FirebaseAuth.instance
              .revokeTokenWithAuthorizationCode(authorizationCode);

          if (context.mounted) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
          user.delete();
        } catch (e) {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Authentication Error'),
                  content: const Text(
                      'An error occurred during the authentication process. Please try again.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
      },
      child: const AbsorbPointer(
        absorbing: true,
        child: AppleSignInButton(
          loadingIndicator: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
