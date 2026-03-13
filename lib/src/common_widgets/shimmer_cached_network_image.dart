import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:flutter/material.dart';

class ShimmerCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final bool showMessage;

  const ShimmerCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.showMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => const AspectRatio(
        aspectRatio: 1,
        child: ShimmerBox(),
      ),
      errorWidget: (context, url, error) => AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded),
            if (showMessage) ...[
              const SizedBox(height: 8),
              const Text('Error loading image'),
            ]
          ],
        ),
      ),
    );
  }
}
