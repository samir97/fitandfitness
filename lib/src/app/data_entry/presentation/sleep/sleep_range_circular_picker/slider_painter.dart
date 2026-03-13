import 'dart:math';

import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_circular_picker/sleep_timer_utils.dart';
import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  double startAngle;
  double endAngle;
  double sweepAngle;
  Color selectionColor;

  late Offset initHandler;
  late Offset endHandler;
  late Offset center;
  late double radius;

  SliderPainter({
    required this.startAngle,
    required this.endAngle,
    required this.sweepAngle,
    required this.selectionColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (startAngle == 0.0 && endAngle == 0.0) return;

    Paint progress = _getPaint(color: selectionColor);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + startAngle, sweepAngle, false, progress);

    Paint handler = _getPaint(color: selectionColor, style: PaintingStyle.fill);
    Paint handlerOuter = _getPaint(color: selectionColor, width: 2.0);

    // draw handlers
    initHandler = radiansToCoordinates(center, -pi / 2 + startAngle, radius);
    canvas.drawCircle(initHandler, 8.0, handler);
    canvas.drawCircle(initHandler, 8.0, handlerOuter);

    endHandler = radiansToCoordinates(center, -pi / 2 + endAngle, radius);
    canvas.drawCircle(endHandler, 8.0, handler);
    canvas.drawCircle(endHandler, 8.0, handlerOuter);
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? 24.0;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
