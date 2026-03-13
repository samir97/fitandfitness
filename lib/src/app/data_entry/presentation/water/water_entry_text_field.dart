import 'package:fitandfitness/src/helpers/double_to_string_extension.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/text_input_formatter/decimal_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class WaterEntryTextField extends ConsumerWidget {
  const WaterEntryTextField({
    super.key,
    this.unit,
    required this.textFieldFocusNode,
    required this.textEditingController,
  });

  final WaterUnit? unit;
  final FocusNode textFieldFocusNode;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (unit == null) return const WaterEntryTextFieldShimmer();
    int firstIncrement = 100;
    int secondIncrement = 250;
    int thirdIncrement = 500;

    if (unit == WaterUnit.cups) {
      firstIncrement = 1;
      secondIncrement = 2;
      thirdIncrement = 3;
    } else if (unit == WaterUnit.fluidOunces) {
      firstIncrement = 3;
      secondIncrement = 6;
      thirdIncrement = 9;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              child: TextFormField(
                enableInteractiveSelection: false,
                focusNode: textFieldFocusNode,
                inputFormatters: <TextInputFormatter>[
                  DecimalTextInputFormatter(
                    decimalRange: 2,
                  ),
                ],
                controller: textEditingController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isCollapsed: true,
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(unit.toString()),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                '+$firstIncrement',
              ),
              onPressed: () => addQuantity(firstIncrement),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                '+$secondIncrement',
              ),
              onPressed: () => addQuantity(secondIncrement),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text(
                '+$thirdIncrement',
              ),
              onPressed: () => addQuantity(thirdIncrement),
            ),
          ],
        ),
      ],
    );
  }

  void addQuantity(int quantity) {
    textFieldFocusNode.unfocus();
    textEditingController.text =
        ((double.tryParse(textEditingController.text) ?? 0) + quantity)
            .toShortString();
  }
}

class WaterEntryTextFieldShimmer extends StatelessWidget {
  const WaterEntryTextFieldShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
