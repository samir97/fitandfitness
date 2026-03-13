import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:flutter/material.dart';

class TrendShimmer extends StatelessWidget {
  const TrendShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        ShimmerRow(
            horizontalPadding: 14, verticalPadding: 8, height: 24, width: 250),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AspectRatio(
            aspectRatio: 1.61,
            child: ShimmerBox(),
          ),
        ),
        ShimmerRow(
          horizontalPadding: 14,
          verticalPadding: 8,
          height: 12,
          width: 100,
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }
}
