import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DisplayShimmer extends StatelessWidget {
  const DisplayShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: style.fontSize!,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          )),
    );
  }
}
