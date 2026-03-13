import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    super.key,
    required this.color,
    required this.values,
    required this.startRangeDate,
    required this.endRangeDate,
    required this.defaultMinY,
    required this.defaultMaxY,
    required this.axisAnnotation,
    required this.averageValues,
  });

  final Color color;
  final List<TrendData> values;
  final DateTime startRangeDate;
  final DateTime endRangeDate;
  final double? defaultMinY;
  final double? defaultMaxY;
  final List<String>? axisAnnotation;
  final bool averageValues;

  @override
  Widget build(BuildContext context) {
    final placeHolderDate = DateTime(
      values.first.date.year,
      values.first.date.month,
      values.first.date.day,
    );
    DateTime minDate = placeHolderDate;
    DateTime maxDate = placeHolderDate;

    final Map<DateTime, double> groupedValues = {};

    for (final value in values) {
      final date = value.date;
      final key = DateTime(date.year, date.month, date.day);

      if (date.isBefore(minDate)) {
        minDate = date;
      }
      if (date.isAfter(maxDate)) {
        maxDate = date;
      }

      final currentValue = groupedValues[key];

      (currentValue == null)
          ? groupedValues[key] = value.value
          : groupedValues[key] = currentValue + value.value;
    }

    if (averageValues) {
      groupedValues.forEach((key, value) {
        final count = values
            .where((element) => DateUtils.isSameDay(key, element.date))
            .length;
        groupedValues[key] = value / count;
      });
    }

    double minValue = groupedValues.values.min;
    final maxValue = groupedValues.values.max;

    final flSpotValues = groupedValues.entries
        .map(
          (e) => FlSpot(
            e.key.millisecondsSinceEpoch.toDouble(),
            e.value,
          ),
        )
        .toList();

    if (minValue == maxValue) minValue = 0;

    final display = createDisplay(
      length: 4,
      decimal: 2,
    );

    return Stack(
      children: [
        IgnorePointer(
          ignoring: true,
          child: LineChart(
            buildChartLines(
              minX: startRangeDate.millisecondsSinceEpoch.toDouble(),
              maxX: endRangeDate.millisecondsSinceEpoch.toDouble(),
              minY: defaultMinY ?? minValue,
              maxY: defaultMaxY ?? maxValue,
              flSpots: flSpotValues,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: (axisAnnotation ??
                  [
                    display(maxValue),
                    display((minValue + maxValue) / 2),
                    display(minValue),
                  ])
              .map(
                (annotation) => Text(
                  annotation,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
              .toList(),
        )
      ],
    );
  }

  LineChartData buildChartLines({
    required double minX,
    required double maxX,
    required double minY,
    required double maxY,
    required List<FlSpot> flSpots,
  }) {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(show: false),
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: flSpots,
          isCurved: true,
          color: color,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: color.withValues(alpha:0.15),
          ),
        ),
      ],
    );
  }
}
