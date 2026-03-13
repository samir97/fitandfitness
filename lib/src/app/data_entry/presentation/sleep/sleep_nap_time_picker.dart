import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_picker_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SleepNapTimePicker extends StatefulWidget {
  final int? initialNapDuration;
  final DateTime? initialWakeUpTime;
  final void Function(int napDuration) onNapDurationChanged;
  final void Function(DateTime wakeUpTime) onWakeUpTimeChanged;

  const SleepNapTimePicker({
    super.key,
    this.initialNapDuration,
    this.initialWakeUpTime,
    required this.onNapDurationChanged,
    required this.onWakeUpTimeChanged,
  });

  @override
  State<SleepNapTimePicker> createState() => _SleepNapTimePickerState();
}

class _SleepNapTimePickerState extends State<SleepNapTimePicker> {
  late int napDuration;
  late DateTime wakeUpTime;

  @override
  void initState() {
    if (widget.initialNapDuration != null && widget.initialWakeUpTime != null) {
      napDuration = widget.initialNapDuration! - widget.initialNapDuration! % 5;
      wakeUpTime = widget.initialWakeUpTime!.subtract(
        Duration(
          minutes: widget.initialWakeUpTime!.minute % 5,
        ),
      );
    } else {
      napDuration = 30;
      wakeUpTime = DateTime.now();
      wakeUpTime = wakeUpTime.subtract(
        Duration(
          minutes: wakeUpTime.minute % 5,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const magnification = 2.35 / 2.1;
    final timeFormat = DateFormat('h:mm a');

    return Column(
      children: [
        const SleepPickerHeader(
          first: "Nap Duration",
          second: "Wake Up Time",
        ),
        SizedBox(
          height: 216,
          child: Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  magnification: magnification,
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(
                    initialItem: napDuration ~/ 5 - 1,
                  ),
                  onSelectedItemChanged: (value) {
                    widget.onNapDurationChanged((value + 1) * 5);
                    setState(() => napDuration = (value + 1) * 5);
                  },
                  children: [
                    for (var i = 5; i < 60; i += 5) Text("$i mins"),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  minuteInterval: 5,
                  initialDateTime: wakeUpTime,
                  onDateTimeChanged: (value) {
                    widget.onWakeUpTimeChanged(value);
                    setState(() => wakeUpTime = value);
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          "Sleep Time: ${timeFormat.format(wakeUpTime.subtract(Duration(minutes: napDuration)))}",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
