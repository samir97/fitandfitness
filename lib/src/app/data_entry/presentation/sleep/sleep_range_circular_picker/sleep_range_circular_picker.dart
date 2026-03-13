import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_time_picker.dart';
import 'package:flutter/material.dart';

class SleepRangeCircularPicker extends StatelessWidget {
  const SleepRangeCircularPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: UniqueKey(),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Stack(
        children: [
          const SleepTimePicker(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 98.0),
              child: Text(
                "7h 30m",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
