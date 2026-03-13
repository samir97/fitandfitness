import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sign Out"),
      content: const Text("Are you sure you want to sign out?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            FirebaseUIAuth.signOut();
            Navigator.of(context).pop();
          },
          child: const Text("Sign Out"),
        ),
      ],
    );
  }
}
