import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_shimmer.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/unit_converter.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaterDetailsTrend extends ConsumerWidget {
  final List<Water> waterEntries;

  const WaterDetailsTrend({
    super.key,
    required this.waterEntries,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    final filteredWaterEntries = _filteredWaterEntries(
      waterEntries,
      startRangeDate,
      endRangeDate,
    );

    return userDetailsAndPrefsController.when(
      data: (userData) {
        final values = _generateTrendData(filteredWaterEntries,
            userData?.unitPreferences.water ?? WaterUnit.milliliters);

        return TrendChart(
            color: Colors.blue,
            values: values,
            unitsLabel: _getUnitsLabel(
                userData?.unitPreferences ?? const UnitPreferences()));
      },
      error: (_, __) => TrendChart(
          color: Colors.blue,
          values: null,
          unitsLabel: _getUnitsLabel(const UnitPreferences())),
      loading: () => const TrendShimmer(),
    );
  }

  List<Water> _filteredWaterEntries(
      List<Water> entries, DateTime start, DateTime end) {
    return entries
        .where(
          (water) =>
              (water.recordedAt.isAfter(start) ||
                  DateUtils.isSameDay(water.recordedAt, start)) &&
              (water.recordedAt.isBefore(end) ||
                  DateUtils.isSameDay(water.recordedAt, end)),
        )
        .toList();
  }

  List<TrendData> _generateTrendData(List<Water> entries, WaterUnit waterUnit) {
    return entries.map((waterEntry) {
      if (waterUnit == WaterUnit.cups) {
        return TrendData(UnitConverter.milliliterToCup(waterEntry.quantity),
            waterEntry.recordedAt);
      } else if (waterUnit == WaterUnit.fluidOunces) {
        return TrendData(
            UnitConverter.milliliterToFluidOunce(waterEntry.quantity),
            waterEntry.recordedAt);
      }
      return TrendData(waterEntry.quantity, waterEntry.recordedAt);
    }).toList();
  }

  String _getUnitsLabel(UnitPreferences unitPreferences) {
    final waterUnit = unitPreferences.water;
    if (waterUnit == WaterUnit.cups) {
      return "Cups";
    } else if (waterUnit == WaterUnit.fluidOunces) {
      return "Fluid Ounces";
    }
    return "Millilitres";
  }
}
