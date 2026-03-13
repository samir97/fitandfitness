import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_shimmer.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/unit_converter.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WeightProperties { bodyFat, weight, muscleMass }

class WeightDetailsTrend extends ConsumerStatefulWidget {
  final List<Weight> weightEntries;

  const WeightDetailsTrend({super.key, required this.weightEntries});

  @override
  ConsumerState createState() => _WeightDetailsTrendState();
}

class _WeightDetailsTrendState extends ConsumerState<WeightDetailsTrend> {
  WeightProperties _selectedWeightProperty = WeightProperties.weight;

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    final weightEntries = _filteredWeightEntries(
        widget.weightEntries, startRangeDate, endRangeDate);

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: CupertinoSlidingSegmentedControl<WeightProperties>(
              backgroundColor: CupertinoColors.systemGrey2,
              thumbColor: Colors.black,
              groupValue: _selectedWeightProperty,
              onValueChanged: (WeightProperties? newValue) {
                if (newValue != null) {
                  setState(() => _selectedWeightProperty = newValue);
                }
              },
              children: const <WeightProperties, Widget>{
                WeightProperties.bodyFat: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Body Fat',
                      style: TextStyle(color: CupertinoColors.white)),
                ),
                WeightProperties.weight: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Weight',
                      style: TextStyle(color: CupertinoColors.white)),
                ),
                WeightProperties.muscleMass: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Muscle Mass',
                      style: TextStyle(color: CupertinoColors.white)),
                ),
              },
            ),
          ),
        ),
        userDetailsAndPrefsController.when(
          data: (userData) {
            final values = _generateTrendData(weightEntries, userData);
            return TrendChart(
              color: Colors.black,
              values: values,
              unitsLabel: _getUnitsLabel(
                  userData?.unitPreferences ?? const UnitPreferences()),
              calculateAverage: true,
            );
          },
          error: (_, __) => TrendChart(
              color: Colors.black,
              values: null,
              unitsLabel: _getUnitsLabel(const UnitPreferences())),
          loading: () => const TrendShimmer(),
        ),
      ],
    );
  }

  List<Weight> _filteredWeightEntries(
      List<Weight> entries, DateTime start, DateTime end) {
    return entries
        .where(
          (weight) =>
              (weight.recordedAt.isAfter(start) ||
                  DateUtils.isSameDay(weight.recordedAt, start)) &&
              (weight.recordedAt.isBefore(end) ||
                  DateUtils.isSameDay(weight.recordedAt, end)),
        )
        .toList();
  }

  List<TrendData> _generateTrendData(
      List<Weight> entries, UserDetailsAndPrefs? userData) {
    switch (_selectedWeightProperty) {
      case WeightProperties.weight:
        return _generateWeightTrendData(
            entries, userData?.unitPreferences.weight ?? WeightUnit.kilograms);
      case WeightProperties.bodyFat:
        return _generatePropertyTrendData(entries, (weight) => weight.bodyFat);
      case WeightProperties.muscleMass:
        return _generatePropertyTrendData(
            entries, (weight) => weight.muscleMass);
    }
  }

  List<TrendData> _generateWeightTrendData(
      List<Weight> entries, WeightUnit weightUnit) {
    return entries
        .map((weight) => TrendData(
            _convertWeight(weight.weight, weightUnit), weight.recordedAt))
        .toList();
  }

  List<TrendData> _generatePropertyTrendData(
      List<Weight> entries, double? Function(Weight) propertySelector) {
    return entries
        .where((weight) => propertySelector(weight) != null)
        .map(
            (weight) => TrendData(propertySelector(weight)!, weight.recordedAt))
        .toList();
  }

  double _convertWeight(double weight, WeightUnit weightUnit) {
    switch (weightUnit) {
      case WeightUnit.kilograms:
        return weight;
      case WeightUnit.pounds:
        return UnitConverter.kilogramToPound(weight);
      case WeightUnit.stones:
        return UnitConverter.kilogramToStone(weight);
    }
  }

  String _getUnitsLabel(UnitPreferences unitPreferences) {
    if (_selectedWeightProperty == WeightProperties.bodyFat ||
        _selectedWeightProperty == WeightProperties.muscleMass) {
      return "Percent";
    }

    switch (unitPreferences.weight) {
      case WeightUnit.kilograms:
        return "Kilograms";
      case WeightUnit.pounds:
        return "Pounds";
      default:
        return "Stones";
    }
  }
}
