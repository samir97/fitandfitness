import 'package:flutter/material.dart';

class SleepPickerHeader extends StatelessWidget {
  final String first;
  final String second;

  const SleepPickerHeader({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              first,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              second,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
