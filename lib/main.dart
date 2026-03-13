import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:fitandfitness/src/app/fit_and_fitness.dart';
import 'package:fitandfitness/src/firebase/firebase_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(const ProviderScope(child: FitAndFitness()));
}
