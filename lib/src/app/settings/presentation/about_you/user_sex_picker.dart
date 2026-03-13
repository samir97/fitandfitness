import 'package:fitandfitness/src/common_widgets/labeled_value_display.dart';
import 'package:fitandfitness/src/common_widgets/picker/picker_bottom_sheet.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:flutter/material.dart';

class UserSexPicker extends StatefulWidget {
  const UserSexPicker({
    super.key,
    this.userSex,
    this.onTap,
    required this.onUserSexChanged,
  });

  final UserSex? userSex;
  final VoidCallback? onTap;
  final Function(UserSex?) onUserSexChanged;

  @override
  State<UserSexPicker> createState() => _UserSexPickerState();
}

class _UserSexPickerState extends State<UserSexPicker> {
  UserSex? _selectedUserSex;

  @override
  void initState() {
    super.initState();
    _selectedUserSex = widget.userSex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return PickerBottomSheet(
              title: "Sex",
              initialSelection: _selectedUserSex?.toString(),
              options: UserSex.stringValues,
              onSelectedEnum: (userSex) {
                final userSexEnum = UserSex.fromString(userSex);
                setState(() => _selectedUserSex = userSexEnum);
                widget.onUserSexChanged(userSexEnum);
              },
              hasPlaceholder: true,
              placeHolderLabel: "",
            );
          },
        );
      },
      child: LabeledValueDisplay(
        labelText: "Sex",
        value: (_selectedUserSex == null) ? "" : _selectedUserSex.toString(),
      ),
    );
  }
}
