import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'There was an error loading your profile, please restart the app.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
