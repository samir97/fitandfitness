import 'dart:async';

import 'package:fitandfitness/src/app/dashboard/presentation/state/overview_date.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_overview_date.g.dart';

@Riverpod(keepAlive: true)
class CurrentOverviewDate extends _$CurrentOverviewDate {
  @override
  OverviewDate build() {
    Timer.periodic(
      const Duration(minutes: 1),
      (Timer timer) {
        final now = DateTime.now();
        if (!isSameDay(state.dateTime, now) && !state.isCustom) {
          state = OverviewDate(now);
        }
      },
    );

    return OverviewDate(DateTime.now());
  }

  bool isSameDay(DateTime start, DateTime end) {
    return start.year == end.year &&
        start.month == end.month &&
        start.day == end.day;
  }

  void update(DateTime dateTime) {
    final now = DateTime.now();
    final isToday = isSameDay(now, dateTime);

    state = OverviewDate(dateTime, isCustom: !isToday);
  }
}
