import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/app/home_page.dart';
import 'package:fitandfitness/src/app/settings/presentation/about_you/about_you_form.dart';
import 'package:fitandfitness/src/app/settings/presentation/about_you/about_you_mixin.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutYouOnboarding extends ConsumerStatefulWidget {
  final UnitPreferences unitPreferences;

  const AboutYouOnboarding({
    super.key,
    required this.unitPreferences,
  });

  @override
  ConsumerState<AboutYouOnboarding> createState() => _AboutYouOnboardingState();
}

class _AboutYouOnboardingState extends ConsumerState<AboutYouOnboarding>
    with AboutYouMixin {
  @override
  void initState() {
    super.initState();
    initAboutYou();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusAllTextFields,
      child: TemplateEntryScreen(
        title: "About you",
        showBackButton: true,
        bodyWidgets: [
          AboutYouForm(
            nameController: nameTextEditingController,
            nameFocusNode: nameFocusNode,
            onUserSexChanged: (userSex) =>
                setState(() => this.userSex = userSex),
            heightFocusNode: heightFocusNode,
            onHeightChanged: (height) => setState(() => this.height = height),
            weightFocusNode: weightFocusNode,
            onWeightChanged: (weight) => setState(() => this.weight = weight),
            birthdate: birthdate,
            onBirthdateChanged: (dateTime) =>
                setState(() => birthdate = dateTime),
            autofocusName: true,
            unfocusAllTextFields: unfocusAllTextFields,
          )
        ],
        floatingActionButton: FloatingActionButton(
          heroTag: "floating_action_menu",
          shape: const CircleBorder(),
          backgroundColor: isValid(context, showDialog: false)
              ? Colors.green
              : CupertinoColors.inactiveGray,
          onPressed: () {
            if (!isValid(context)) return;

            final name = nameTextEditingController.text.trim();

            ref.read(userDetailsAndPrefsControllerProvider.notifier).create(
                  UserDetailsAndPrefs(
                    userDetails: UserDetails(
                      firstName: name,
                      birthdate: birthdate!,
                      sex: userSex!,
                      height: height!,
                      modifiedAt: DateTime.now(),
                      recordedAt: DateTime.now(),
                    ),
                    unitPreferences: widget.unitPreferences,
                    acceptedTermsVersion: 1,
                  ),
                );

            final now = DateTime.now();

            ref.read(weightControllerProvider.notifier).addOrUpdateEntry(
                  Weight(
                    weight: weight!,
                    modifiedAt: now,
                    recordedAt: now,
                  ),
                );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MyHomePage()),
              ModalRoute.withName('/'),
            );
          },
          child: const Icon(Icons.done_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
