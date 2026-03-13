import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartRangePopUpButton extends ConsumerWidget {
  const ChartRangePopUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      tooltip: 'Range',
      icon: Icon(
        Icons.history,
        size: Theme.of(context).textTheme.headlineSmall?.fontSize ?? 0 + 4,
      ),
      onSelected: (String newValue) {
        final trendRange = TrendRange.fromStringToDuration(newValue);
        ref.read(trendRangeProvider.notifier).update(trendRange);
      },
      itemBuilder: (BuildContext context) {
        return TrendRange.values.map(
          (TrendRange trendRange) {
            return PopupMenuItem<String>(
              value: trendRange.toString(),
              child: Text(trendRange.toString()),
            );
          },
        ).toList();
      },
    );
  }
}

enum TrendRange {
  last7Days,
  last30Days,
  last90Days,
  last180Days,
  lastYear;

  static Duration fromStringToDuration(String trendRange) {
    switch (trendRange) {
      case 'Last 7 Days':
        return const Duration(days: 7);
      case 'Last 30 Days':
        return const Duration(days: 30);
      case 'Last 90 Days':
        return const Duration(days: 90);
      case 'Last 180 Days':
        return const Duration(days: 180);
      case 'Last Year':
        return const Duration(days: 365);
      default:
        return const Duration(days: 0);
    }
  }

  @override
  String toString() {
    switch (this) {
      case TrendRange.last7Days:
        return 'Last 7 Days';
      case TrendRange.last30Days:
        return 'Last 30 Days';
      case TrendRange.last90Days:
        return 'Last 90 Days';
      case TrendRange.last180Days:
        return 'Last 180 Days';
      case TrendRange.lastYear:
        return 'Last Year';
    }
  }
}
