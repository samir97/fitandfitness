import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_picker_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SleepRangePicker extends StatefulWidget {
  final DateTime? initialSleepTime;
  final DateTime? initialWakeUpTime;
  final void Function(DateTime sleepTime) onSleepTimeChanged;
  final void Function(DateTime wakeUpTime) onWakeUpTimeChanged;

  const SleepRangePicker({
    super.key,
    this.initialSleepTime,
    this.initialWakeUpTime,
    required this.onSleepTimeChanged,
    required this.onWakeUpTimeChanged,
  });

  @override
  State<SleepRangePicker> createState() => _SleepRangePickerState();
}

class _SleepRangePickerState extends State<SleepRangePicker> {
  late DateTime wakeUpTime;
  late DateTime sleepTime;

  @override
  void initState() {
    if (widget.initialSleepTime != null && widget.initialWakeUpTime != null) {
      sleepTime = widget.initialSleepTime!.subtract(
        Duration(
          minutes: widget.initialSleepTime!.minute % 5,
        ),
      );
      wakeUpTime = widget.initialWakeUpTime!.subtract(
        Duration(
          minutes: widget.initialWakeUpTime!.minute % 5,
        ),
      );
    } else {
      wakeUpTime = DateTime.now();
      wakeUpTime = wakeUpTime.subtract(
        Duration(
          minutes: wakeUpTime.minute % 5,
        ),
      );
      sleepTime = wakeUpTime.subtract(
        const Duration(hours: 8),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SleepPickerHeader(
          first: "Sleep Time",
          second: "Wake Up Time",
        ),
        SizedBox(
          height: 216,
          child: Row(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                    initialDateTime: sleepTime,
                    mode: CupertinoDatePickerMode.time,
                    minuteInterval: 5,
                    onDateTimeChanged: (DateTime newSleepTime) {
                      widget.onSleepTimeChanged(newSleepTime);
                      setState(() => sleepTime = newSleepTime);
                    }),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: wakeUpTime,
                  mode: CupertinoDatePickerMode.time,
                  minuteInterval: 5,
                  onDateTimeChanged: (DateTime newWakeUpTime) {
                    widget.onWakeUpTimeChanged(newWakeUpTime);
                    setState(() => wakeUpTime = newWakeUpTime);
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          "Duration: ${sleepDuration(sleepTime, wakeUpTime).inHours}h ${sleepDuration(sleepTime, wakeUpTime).inMinutes % 60}m",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Duration sleepDuration(DateTime sleepTime, DateTime wakeTime) {
    final kanyeBirthdate = DateTime(1977, 6, 8);
    final adjustedSleepTime = kanyeBirthdate.add(
      Duration(
        hours: sleepTime.hour,
        minutes: sleepTime.minute,
      ),
    );
    final adjustedWakeTime = kanyeBirthdate.add(
      Duration(
        hours: wakeTime.hour,
        minutes: wakeTime.minute,
      ),
    );

    if (adjustedSleepTime.isAfter(adjustedWakeTime)) {
      return adjustedWakeTime
          .add(
            const Duration(
              days: 1,
            ),
          )
          .difference(adjustedSleepTime);
    } else {
      return adjustedWakeTime.difference(adjustedSleepTime);
    }
  }
}
