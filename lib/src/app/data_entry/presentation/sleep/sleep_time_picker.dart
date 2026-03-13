import 'dart:math';

import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_circular_picker/circular_slider_paint.dart';
import 'package:flutter/material.dart';

class SleepTimePicker extends StatefulWidget {
  const SleepTimePicker({super.key});

  @override
  State<SleepTimePicker> createState() => _SleepTimePickerState();
}

class _SleepTimePickerState extends State<SleepTimePicker> {
  int init = 30;
  int end = 100;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SleepTimerDial(),
          ),
          Center(
            child: CircularSliderPaint(
              baseColor: Colors.deepPurple.shade100,
              onSelectionChange: (start, last) {
                setState(() {
                  init = start;
                  end = last;
                });
              },
              intervals: 288,
              selectionColor: Colors.deepPurple,
              init: init,
              end: end,
            ),
          ),
        ],
      ),
    );
  }
}

class SleepTimerDial extends StatelessWidget {
  const SleepTimerDial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final labelMediumFont = Theme.of(context).textTheme.labelMedium!;
    final labelLargeFont = Theme.of(context).textTheme.labelLarge!;
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
            child: CustomPaint(
              painter: TickPainter(
                tickCount: 96,
                tickPerSection: 4,
                textStyle:
                    labelMediumFont.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: Colors.lightBlueAccent,
                  size: labelLargeFont.fontSize,
                ),
                Icon(
                  Icons.wb_sunny_rounded,
                  color: Colors.amber,
                  size: labelLargeFont.fontSize,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class TickPainter extends CustomPainter {
  final double longTick = -6;
  final double shortTick = -2;

  final int tickCount;
  final int tickPerSection;
  final int tickInset;
  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  TickPainter({
    this.tickCount = 35,
    this.tickPerSection = 5,
    this.tickInset = 0,
    required this.textStyle,
  })  : tickPaint = Paint()
          ..color = textStyle.color!.withValues(alpha:0.5)
          ..strokeWidth = 1.5,
        textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    canvas.save();

    final radius = size.width / 2 - 6;

    for (var i = 0; i < tickCount; i++) {
      final tickLength = i % tickPerSection == 0 ? longTick : shortTick;
      canvas.drawLine(
        Offset(0, -radius),
        Offset(0, -radius - tickLength),
        tickPaint,
      );

      if (i % (tickPerSection * 2) == 0) {
        canvas.save();
        canvas.translate(0.0, -(size.width / 2) + 24);

        final List<num> highlightedNumbers = [0, 6, 12, 18];

        textPainter.text = TextSpan(
          text: (i ~/ 4).toString(),
          style: textStyle.copyWith(
            color: textStyle.color!
                .withValues(alpha:highlightedNumbers.contains(i ~/ 4) ? 1 : 0.5),
          ),
        );

        textPainter.layout();

        final tickPercent = i / tickCount;

        canvas.rotate(-tickPercent * 2 * pi);

        textPainter.paint(
          canvas,
          Offset(-textPainter.width / 2, -textPainter.height / 2),
        );

        canvas.restore();
      }
      canvas.rotate((2 * pi) / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
