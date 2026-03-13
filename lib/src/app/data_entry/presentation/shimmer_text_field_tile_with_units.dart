import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextFieldTileWithUnits extends StatelessWidget {
  const ShimmerTextFieldTileWithUnits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Adjust base color
      highlightColor: Colors.grey[100]!, // Adjust highlight color
      child: ListTile(
        title: Row(
          children: [
            Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4), // Rounded corners
              ),
            ),
            const SizedBox(width: 150),
            Expanded(
              child: Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
