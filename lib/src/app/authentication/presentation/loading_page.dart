import 'package:fitandfitness/src/common_widgets/adaptive_loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF506478),
        child: const Center(
          child: AdaptiveLoadingIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
