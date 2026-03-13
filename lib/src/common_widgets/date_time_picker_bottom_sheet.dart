import 'package:fitandfitness/src/common_widgets/bottom_sheet_title_bar.dart';
import 'package:flutter/cupertino.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  final String title;
  final DateTime? initialDateTime;
  final bool dateOnly;
  final Function(DateTime dateTime) onSave;

  const DateTimePickerBottomSheet({
    super.key,
    required this.title,
    this.initialDateTime,
    this.dateOnly = false,
    required this.onSave,
  });

  @override
  State<DateTimePickerBottomSheet> createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    final initialDateTime = widget.initialDateTime;

    if (initialDateTime == null || now.isBefore(initialDateTime)) {
      _dateTime = now;
    } else {
      _dateTime = widget.initialDateTime!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetTitleBar(
          title: widget.title,
          onSave: () => widget.onSave(_dateTime),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: 4,
              bottom: MediaQuery.of(context).viewInsets.bottom + 8,
            ),
            child: CupertinoDatePicker(
              initialDateTime: _dateTime,
              mode: widget.dateOnly
                  ? CupertinoDatePickerMode.date
                  : CupertinoDatePickerMode.dateAndTime,
              use24hFormat: true,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime newTime) {
                setState(() => _dateTime = newTime);
              },
            ),
          ),
        ),
      ],
    );
  }
}
