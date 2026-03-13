import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_circular_picker/base_painter.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_circular_picker/sleep_timer_utils.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_range_circular_picker/slider_painter.dart';
import 'package:flutter/material.dart';

class CircularSliderPaint extends StatefulWidget {
  final int init;
  final int end;
  final int intervals;
  final Function(int init, int end) onSelectionChange;
  final Color baseColor;
  final Color selectionColor;
  final Widget? child;

  const CircularSliderPaint({
    super.key,
    required this.intervals,
    required this.init,
    required this.end,
    this.child,
    required this.onSelectionChange,
    required this.baseColor,
    required this.selectionColor,
  });

  @override
  State<CircularSliderPaint> createState() => _CircularSliderPaintState();
}

class _CircularSliderPaintState extends State<CircularSliderPaint> {
  bool _isInitHandlerSelected = false;
  bool _isEndHandlerSelected = false;

  late SliderPainter _painter;

  /// start angle in radians where we need to locate the init handler
  late double _startAngle;

  /// end angle in radians where we need to locate the end handler
  late double _endAngle;

  /// the absolute angle in radians representing the selection
  late double _sweepAngle;

  @override
  void initState() {
    super.initState();
    _calculatePaintData();
  }

  // we need to update this widget both with gesture detector but
  // also when the parent widget rebuilds itself
  @override
  void didUpdateWidget(CircularSliderPaint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.init != widget.init || oldWidget.end != widget.end) {
      _calculatePaintData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _onPanDown,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: BasePainter(
            baseColor: widget.baseColor,
          ),
          foregroundPainter: _painter,
          child: widget.child,
        ),
      ),
    );
  }

  void _calculatePaintData() {
    double initPercent = valueToPercentage(widget.init, widget.intervals);
    double endPercent = valueToPercentage(widget.end, widget.intervals);
    double sweep = getSweepAngle(initPercent, endPercent);

    _startAngle = percentageToRadians(initPercent);
    _endAngle = percentageToRadians(endPercent);
    _sweepAngle = percentageToRadians(sweep.abs());

    _painter = SliderPainter(
      startAngle: _startAngle,
      endAngle: _endAngle,
      sweepAngle: _sweepAngle,
      selectionColor: widget.selectionColor,
    );
  }

  _onPanUpdate(DragUpdateDetails details) {
    if (!_isInitHandlerSelected && !_isEndHandlerSelected) {
      return;
    }

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var position = renderBox.globalToLocal(details.globalPosition);

    var angle = coordinatesToRadians(_painter.center, position);
    var percentage = radiansToPercentage(angle);
    var newValue = percentageToValue(percentage, widget.intervals);

    if (_isInitHandlerSelected) {
      widget.onSelectionChange(newValue, widget.end);
    } else {
      widget.onSelectionChange(widget.init, newValue);
    }
  }

  _onPanEnd(_) {
    _isInitHandlerSelected = false;
    _isEndHandlerSelected = false;
  }

  _onPanDown(DragDownDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var position = renderBox.globalToLocal(details.globalPosition);
    _isInitHandlerSelected =
        isPointInsideCircle(position, _painter.initHandler, 12.0);
    if (!_isInitHandlerSelected) {
      _isEndHandlerSelected =
          isPointInsideCircle(position, _painter.endHandler, 12.0);
    }
  }
}
