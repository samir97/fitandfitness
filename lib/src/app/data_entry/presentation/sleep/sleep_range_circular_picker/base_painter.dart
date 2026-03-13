import 'dart:math';

import 'package:flutter/material.dart';

class BasePainter extends CustomPainter {
  Color baseColor;

  BasePainter({required this.baseColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = baseColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 32.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
