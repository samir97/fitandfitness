import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> _launchURL(
      {required BuildContext context,
      required Uri url,
      required String errorTitle,
      required String errorMessage}) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (context.mounted) {
        _showErrorDialog(
          context: context,
          errorTitle: errorTitle,
          errorMessage: errorMessage,
        );
      }
    }
  }

  static launchPrivacyPolicy(BuildContext context) {
    const String privacyPolicyUrl =
        "https://fitandfitness.app/privacy-policy.html";
    final Uri privacyPolicyUri = Uri.parse(privacyPolicyUrl);

    return _launchURL(
      context: context,
      url: privacyPolicyUri,
      errorTitle: "Privacy Policy.",
      errorMessage: "You can read our privacy policy at $privacyPolicyUrl",
    );
  }

  static launchTermsAndConditions(BuildContext context) {
    const String termsAndConditionsUrl =
        "https://fitandfitness.app/terms-conditions.html";
    final Uri termsAndConditionsUri = Uri.parse(termsAndConditionsUrl);

    return _launchURL(
      context: context,
      url: termsAndConditionsUri,
      errorTitle: "Terms And Conditions.",
      errorMessage:
          "You can read our terms and conditions at $termsAndConditionsUrl",
    );
  }

  static launchContactUs(BuildContext context) {
    final Uri contactUsUrl = Uri.parse("mailto:contact@fitandfitness.app");

    return _launchURL(
      context: context,
      url: contactUsUrl,
      errorTitle: "Contact Us",
      errorMessage: "You can contact us at contact@fitandfitness.app",
    );
  }

  static _showErrorDialog({
    required BuildContext context,
    required String errorTitle,
    required String errorMessage,
  }) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(errorTitle),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }
}
