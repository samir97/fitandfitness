import 'package:fitandfitness/src/app/details_page/presentation/trend_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsShimmerScreen extends StatelessWidget {
  const DetailsShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ListView(
        children: const [
          ShimmerRow(
            leftPadding: 14,
            topPadding: 16,
            height: 28,
            width: 75,
          ),
          SizedBox(height: 16),
          TrendShimmer(),
          ShimmerRow(
            horizontalPadding: 20,
            height: 28,
            width: 80,
          ),
          SizedBox(height: 24),
          ShimmerListTile(),
          SizedBox(height: 24),
          ShimmerListTile(),
          SizedBox(height: 24),
          ShimmerListTile(),
          SizedBox(height: 24),
          ShimmerListTile(),
          SizedBox(height: 24),
          ShimmerListTile()
        ],
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
          decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Colors.grey[100]!,
      )),
    );
  }
}

class ShimmerRow extends StatelessWidget {
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  final double width;
  final Alignment alignment;

  const ShimmerRow({
    super.key,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.rightPadding = 0,
    this.bottomPadding = 0,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    required this.height,
    required this.width,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding + horizontalPadding,
        topPadding + verticalPadding,
        rightPadding + horizontalPadding,
        bottomPadding + verticalPadding,
      ),
      child: Align(
        alignment: alignment,
        child: SizedBox(
          height: height,
          width: width,
          child: const ShimmerBox(),
        ),
      ),
    );
  }
}

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            width: 100,
            child: ShimmerBox(),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 18,
            width: 300,
            child: ShimmerBox(),
          ),
        ],
      ),
    );
  }
}
