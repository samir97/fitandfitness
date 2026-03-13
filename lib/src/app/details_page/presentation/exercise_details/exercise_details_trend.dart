import 'package:fitandfitness/src/app/details_page/presentation/exercise_details/exercise_details_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_shimmer.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:fitandfitness/src/data/controllers/user_details_and_prefs/user_details_and_prefs_controller.dart';
import 'package:fitandfitness/src/helpers/unit_converter.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/units.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseDetailsTrend extends ConsumerStatefulWidget {
  final List<ExerciseEntry> exerciseEntries;

  const ExerciseDetailsTrend({super.key, required this.exerciseEntries});

  @override
  ConsumerState createState() => _ExerciseDetailsTrendState();
}

class _ExerciseDetailsTrendState extends ConsumerState<ExerciseDetailsTrend> {
  ExerciseProperties _selectedExerciseProperty = ExerciseProperties.cardio;

  @override
  Widget build(BuildContext context) {
    final userDetailsAndPrefsController =
        ref.watch(userDetailsAndPrefsControllerProvider);

    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    final exerciseEntries = _filteredExerciseEntries(
      widget.exerciseEntries,
      startRangeDate,
      endRangeDate,
    );

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: CupertinoSlidingSegmentedControl<ExerciseProperties>(
              backgroundColor: CupertinoColors.systemGrey2,
              thumbColor: Colors.yellow.shade700,
              groupValue: _selectedExerciseProperty,
              onValueChanged: (ExerciseProperties? newValue) {
                if (newValue != null) {
                  setState(() => _selectedExerciseProperty = newValue);
                }
              },
              children: const <ExerciseProperties, Widget>{
                ExerciseProperties.cardio: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Cardio',
                      style: TextStyle(color: CupertinoColors.white)),
                ),
                ExerciseProperties.strength: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Strength',
                      style: TextStyle(color: CupertinoColors.white)),
                ),
              },
            ),
          ),
        ),
        userDetailsAndPrefsController.when(
          data: (userData) {
            final values = _generateTrendData(exerciseEntries, userData);

            return TrendChart(
                color: Colors.yellow.shade700,
                values: values,
                unitsLabel: _getUnitsLabel(
                    userData?.unitPreferences ?? const UnitPreferences()));
          },
          error: (_, __) => TrendChart(
              color: Colors.yellow.shade700,
              values: null,
              unitsLabel: _getUnitsLabel(const UnitPreferences())),
          loading: () => const TrendShimmer(),
        ),
      ],
    );
  }

  List<ExerciseEntry> _filteredExerciseEntries(
      List<ExerciseEntry> entries, DateTime start, DateTime end) {
    return entries
        .where(
          (exercise) =>
              (exercise.recordedAt.isAfter(start) ||
                  DateUtils.isSameDay(exercise.recordedAt, start)) &&
              (exercise.recordedAt.isBefore(end) ||
                  DateUtils.isSameDay(exercise.recordedAt, end)),
        )
        .toList();
  }

  List<TrendData> _generateTrendData(
      List<ExerciseEntry> entries, UserDetailsAndPrefs? userData) {
    switch (_selectedExerciseProperty) {
      case ExerciseProperties.cardio:
        return _generateCardioTrendData(
          entries,
          userData?.unitPreferences.energy ?? EnergyUnit.kilojoules,
        );
      case ExerciseProperties.strength:
        return _generateStrengthTrendData(
          entries,
          userData?.unitPreferences.workoutWeight ?? WeightUnit.kilograms,
        );
    }
  }

  List<TrendData> _generateCardioTrendData(
      List<ExerciseEntry> entries, EnergyUnit energyUnit) {
    return entries.whereType<Cardio>().map((exercise) {
      if (energyUnit == EnergyUnit.calories) {
        return TrendData(
            UnitConverter.kilojouleToCalorie(exercise.caloriesBurned),
            exercise.recordedAt);
      } else {
        return TrendData(exercise.caloriesBurned, exercise.recordedAt);
      }
    }).toList();
  }

  List<TrendData> _generateStrengthTrendData(
    List<ExerciseEntry> entries,
    WeightUnit weightUnit,
  ) {
    return entries
        .whereType<Strength>()
        .map((exercise) {
          final reps = exercise.repetitionsPerSet * exercise.numberOfSets;
          final weight = exercise.weightPerSet ?? 0;
          if (weightUnit == WeightUnit.pounds ||
              weightUnit == WeightUnit.stones) {
            return TrendData(UnitConverter.kilogramToPound(reps * weight),
                exercise.recordedAt);
          }
          return TrendData(reps * weight, exercise.recordedAt);
        })
        .where((trendData) => trendData.value != 0)
        .toList();
  }

  String _getUnitsLabel(UnitPreferences unitPreferences) {
    if (_selectedExerciseProperty == ExerciseProperties.cardio) {
      return unitPreferences.energy == EnergyUnit.kilojoules
          ? "Kilojoules"
          : "Calories";
    } else {
      return unitPreferences.workoutWeight == WeightUnit.kilograms
          ? "Reps x Weight (kg)"
          : "Reps x Weight (lbs)";
    }
  }
}
