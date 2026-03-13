import 'package:fitandfitness/src/app/data_entry/presentation/template_entry_screen.dart';
import 'package:fitandfitness/src/app/settings/presentation/about_you/about_you_form.dart';
import 'package:fitandfitness/src/app/settings/presentation/about_you/about_you_mixin.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutYouScreen extends ConsumerStatefulWidget {
  final UserDetailsAndPrefs userDetailsAndPrefs;
  final Weight lastWeight;

  const AboutYouScreen({
    super.key,
    required this.userDetailsAndPrefs,
    required this.lastWeight,
  });

  @override
  ConsumerState<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends ConsumerState<AboutYouScreen>
    with AboutYouMixin {
  @override
  void initState() {
    super.initState();
    initAboutYou();
    nameTextEditingController.text =
        widget.userDetailsAndPrefs.userDetails.firstName;
    birthdate = widget.userDetailsAndPrefs.userDetails.birthdate;
    userSex = widget.userDetailsAndPrefs.userDetails.sex;
    height = widget.userDetailsAndPrefs.userDetails.height;
    weight = widget.lastWeight.weight;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusAllTextFields,
      child: TemplateEntryScreen(
        title: "About you",
        showBackButton: true,
        onSubmit: () {
          if (!isValid(context)) return;

          final name = nameTextEditingController.text.trim();

          final userDetailsAndPrefsNotifier = ref.read(
            userDetailsAndPrefsControllerProvider.notifier,
          );

          userDetailsAndPrefsNotifier.editUserDetails(
            UserDetails(
              firstName: name,
              birthdate: birthdate!,
              sex: userSex!,
              height: height!,
              modifiedAt: DateTime.now(),
              recordedAt: DateTime.now(),
            ),
          );

          final weightControllerNotifier = ref.read(
            weightControllerProvider.notifier,
          );

          final now = DateTime.now();

          if (widget.lastWeight.weight != weight ||
              !DateUtils.isSameDay(now, widget.lastWeight.recordedAt)) {
            weightControllerNotifier.addOrUpdateEntry(
              Weight(weight: weight!, modifiedAt: now, recordedAt: now),
            );
          }

          Navigator.of(context).pop();
        },
        bodyWidgets: [
          AboutYouForm(
            nameController: nameTextEditingController,
            nameFocusNode: nameFocusNode,
            birthdate: birthdate,
            onBirthdateChanged: (dateTime) =>
                setState(() => birthdate = dateTime),
            userSex: userSex,
            onUserSexChanged: (userSex) {
              setState(() => this.userSex = userSex);
            },
            heightFocusNode: heightFocusNode,
            initialHeight: height,
            onHeightChanged: (height) => setState(() => this.height = height),
            initialWeight: weight,
            onWeightChanged: (weight) => setState(() => this.weight = weight),
            weightFocusNode: weightFocusNode,
            autofocusName: false,
            unfocusAllTextFields: unfocusAllTextFields,
          )
        ],
      ),
    );
  }
}
