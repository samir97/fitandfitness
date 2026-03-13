import 'package:fitandfitness/src/app/settings/presentation/about_you/birthdate_picker.dart';
import 'package:fitandfitness/src/app/settings/presentation/about_you/user_sex_picker.dart';
import 'package:fitandfitness/src/common_widgets/date_time_picker_bottom_sheet.dart';
import 'package:fitandfitness/src/common_widgets/height/entry/height_entry.dart';
import 'package:fitandfitness/src/common_widgets/weight/entry/weight_entry.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:fitandfitness/src/text_input_formatter/trim_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutYouForm extends StatelessWidget {
  final bool autofocusName;
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final UserSex? userSex;
  final Function(UserSex?) onUserSexChanged;
  final DateTime? birthdate;
  final Function(DateTime) onBirthdateChanged;
  final FocusNode heightFocusNode;
  final double? initialHeight;
  final Function(double?) onHeightChanged;
  final FocusNode weightFocusNode;
  final double? initialWeight;
  final Function(double?) onWeightChanged;
  final VoidCallback unfocusAllTextFields;

  const AboutYouForm(
      {super.key,
      required this.autofocusName,
      required this.nameController,
      required this.nameFocusNode,
      this.birthdate,
      required this.onBirthdateChanged,
      this.userSex,
      required this.onUserSexChanged,
      required this.heightFocusNode,
      this.initialHeight,
      required this.onHeightChanged,
      required this.weightFocusNode,
      this.initialWeight,
      required this.onWeightChanged,
      required this.unfocusAllTextFields});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 16,
          ),
          child: TextField(
            controller: nameController,
            focusNode: nameFocusNode,
            style: Theme.of(context).textTheme.titleMedium,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text("First name"),
            ),
            inputFormatters: <TextInputFormatter>[
              TrimTextInputFormatter(),
            ],
            autocorrect: false,
            autofocus: autofocusName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: GestureDetector(
            onTap: () {
              unfocusAllTextFields();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return DateTimePickerBottomSheet(
                    title: "Birthdate",
                    dateOnly: true,
                    initialDateTime: birthdate ?? DateTime(2000),
                    onSave: onBirthdateChanged,
                  );
                },
              );
            },
            child: BirthdatePicker(
              birthdate: birthdate,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: UserSexPicker(
            userSex: userSex,
            onTap: unfocusAllTextFields,
            onUserSexChanged: onUserSexChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: HeightEntry(
            height: initialHeight,
            onTap: unfocusAllTextFields,
            onHeightChanged: onHeightChanged,
            focusNode: heightFocusNode,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 16,
          ),
          child: WeightEntry(
            weight: initialWeight,
            onTap: unfocusAllTextFields,
            onWeightChanged: onWeightChanged,
            focusNode: weightFocusNode,
          ),
        ),
      ],
    );
  }
}
