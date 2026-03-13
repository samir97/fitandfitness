import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LabeledValueShimmer extends StatelessWidget {
  const LabeledValueShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final textHeight = (textStyle?.fontSize ?? 24) * (textStyle?.height ?? 1);

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
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 80,
              height: textHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: textHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
