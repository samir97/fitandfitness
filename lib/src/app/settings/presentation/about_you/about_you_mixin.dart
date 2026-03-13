import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AboutYouMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  DateTime? birthdate;
  UserSex? userSex;
  double? height;
  double? weight;

  late TextEditingController nameTextEditingController;

  late FocusNode nameFocusNode;
  late FocusNode heightFocusNode;
  late FocusNode weightFocusNode;

  void initAboutYou() {
    nameTextEditingController = TextEditingController()
      ..addListener(() => setState(() {}));

    nameFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    weightFocusNode = FocusNode();
  }

  bool _validateName(String name) => name.trim().isNotEmpty;

  bool _validateBirthdate(DateTime? birthdate) => birthdate != null;

  bool _validateUserSex(UserSex? userSex) => userSex != null;

  void _showErrorDialog(BuildContext context, String title, String body) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => EntryAlertDialog(
        title: title,
        body: body,
      ),
    );
  }

  bool isValid(BuildContext context, {showDialog = true}) {
    final isValidName = _validateName(nameTextEditingController.text);
    final isValidBirthdate = _validateBirthdate(birthdate);
    final isValidUserSex = _validateUserSex(userSex);
    final isValidHeight = height != null;
    final isValidWeight = weight != null;

    if (!isValidName && showDialog) {
      _showErrorDialog(context, 'Invalid name',
          'Name cannot be empty. Please enter a valid name.');
    } else if (!isValidBirthdate && showDialog) {
      _showErrorDialog(context, 'Invalid birthdate',
          'Birthdate cannot be empty. Please enter a valid birthdate.');
    } else if (!isValidUserSex && showDialog) {
      _showErrorDialog(context, 'Invalid sex',
          'Sex cannot be empty. Please select a valid option.');
    } else if (!isValidHeight && showDialog) {
      _showErrorDialog(context, 'Invalid height',
          'Height cannot be empty. Please enter a valid height.');
    } else if (!isValidWeight && showDialog) {
      _showErrorDialog(context, 'Invalid weight',
          'Weight cannot be empty. Please enter a valid weight.');
    }

    return isValidName &&
        isValidBirthdate &&
        isValidUserSex &&
        isValidHeight &&
        isValidWeight;
  }

  void unfocusAllTextFields() {
    nameFocusNode.unfocus();
    weightFocusNode.unfocus();
    heightFocusNode.unfocus();
    weightFocusNode.unfocus();
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();

    nameFocusNode.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
    super.dispose();
  }
}
