import 'package:fitandfitness/src/app/details_page/presentation/custom_line_chart.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_range_pop_up_button.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TrendChart extends ConsumerWidget {
  final Color color;
  final String unitsLabel;
  final List<TrendData>? values;
  final List<String>? axisAnnotation;
  final double? defaultMinY;
  final double? defaultMaxY;
  final bool calculateAverage;

  const TrendChart({
    super.key,
    required this.color,
    required this.values,
    required this.unitsLabel,
    this.axisAnnotation,
    this.defaultMinY,
    this.defaultMaxY,
    this.calculateAverage = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    final locale = Localizations.localeOf(context);
    DateFormat formatter = DateFormat.yMMMd(locale.toString());

    final formattedEndDate = formatter.format(endRangeDate);
    final formattedStartDate = formatter.format(startRangeDate);

    final dates = values
        ?.map(
          (e) => DateTime(
            e.date.year,
            e.date.month,
            e.date.day,
          ),
        )
        .toSet();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 14,
            top: 8,
            right: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trend',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const ChartRangePopUpButton()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            '$formattedStartDate - $formattedEndDate',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: AspectRatio(
            aspectRatio: 1.61,
            child: ((dates?.length ?? 0) < 2)
                ? Center(
                    child: Text(
                      (values == null)
                          ? "Unable to retrieve data"
                          : "Not enough data in range",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : CustomLineChart(
                    color: color,
                    values: values!,
                    startRangeDate: startRangeDate,
                    endRangeDate: endRangeDate,
                    defaultMinY: defaultMinY,
                    defaultMaxY: defaultMaxY,
                    axisAnnotation: axisAnnotation,
                    averageValues: calculateAverage,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("Units: $unitsLabel"),
          ),
        ),
      ],
    );
  }
}

class TrendData {
  final double value;
  final DateTime date;

  const TrendData(this.value, this.date);
}
