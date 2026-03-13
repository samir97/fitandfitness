import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WakeUpDateSelector extends StatefulWidget {
  const WakeUpDateSelector({
    super.key,
  });

  @override
  State<WakeUpDateSelector> createState() => _WakeUpDateSelectorState();
}

class _WakeUpDateSelectorState extends State<WakeUpDateSelector> {
  late DateTime dateTime;

  @override
  void initState() {
    dateTime = DateTime.now();
    dateTime =
        dateTime.subtract(Duration(days: 1, minutes: dateTime.minute % 10));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sleep Time"),
          centerTitle: true,
          leading: TextButton(
            onPressed: () {},
            child: const Text("Close"),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 8,
          ),
          child: CupertinoDatePicker(
            initialDateTime: dateTime,
            minuteInterval: 10,
            mode: CupertinoDatePickerMode.dateAndTime,
            use24hFormat: true,
            maximumDate: DateTime.now().subtract(
              Duration(
                minutes: DateTime.now().minute % 10,
              ),
            ),
            onDateTimeChanged: (DateTime newTime) {
              setState(() => dateTime = newTime);
            },
          ),
        ),
      ),
    );
  }
}
