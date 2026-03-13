import 'package:fitandfitness/src/app/authentication/presentation/auth_gate.dart';
import 'package:fitandfitness/src/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FitAndFitness extends StatelessWidget {
  const FitAndFitness({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitAndFitness',
      color: const Color(0xFF506478),
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme(context),
      darkTheme: Constants.lightTheme(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'GB'),
      ],
      initialRoute: '/',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const AuthGate());
      default:
        return null;
    }
  }
}
