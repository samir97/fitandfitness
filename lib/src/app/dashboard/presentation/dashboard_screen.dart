import 'package:fitandfitness/src/app/dashboard/presentation/exercise/exercise_widget.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/mood/mood_widget.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/sleep_widget.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/water_widget.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/weight_widget.dart';
import 'package:fitandfitness/src/common_widgets/default_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultScaffold(
      cacheExtent: 1000,
      bodyWidgets: [
        SizedBox(
          height: 16,
        ),
        WaterWidget(),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: MoodWidget(),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: WeightWidget(),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ExerciseWidget(),
        SizedBox(
          height: 8,
        ),
        SleepWidget(),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
