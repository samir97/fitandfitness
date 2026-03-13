import 'package:flutter/material.dart';

class LabeledValueDisplay extends StatelessWidget {
  const LabeledValueDisplay({
    super.key,
    required this.labelText,
    required this.value,
  });

  final String labelText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
            color: (Theme.of(context).brightness == Brightness.light)
                ? Colors.black38
                : Colors.white38),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            labelText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
