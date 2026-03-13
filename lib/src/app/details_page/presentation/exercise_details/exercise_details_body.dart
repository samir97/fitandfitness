import 'package:fitandfitness/src/app/details_page/presentation/details_empty_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/exercise_details/exercise_details_tile.dart';
import 'package:fitandfitness/src/app/details_page/presentation/exercise_details/exercise_details_trend.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseDetailsBody extends ConsumerWidget {
  const ExerciseDetailsBody({
    super.key,
    required this.cupertinoContext,
    required this.exerciseEntries,
  });

  final BuildContext cupertinoContext;
  final List<ExerciseEntry> exerciseEntries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (exerciseEntries.isEmpty) {
      return const DetailsEmptyScreen(entryType: EntryType.exercise);
    }

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ExerciseDetailsTrend(
              exerciseEntries: exerciseEntries,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 0, 14, 8),
              child: Text(
                'Entries',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    ExerciseDetailsTile(
                      cupertinoContext: cupertinoContext,
                      exercise: exerciseEntries[index],
                    ),
                    if (index != exerciseEntries.length - 1)
                      const Divider(
                        height: 0,
                      ),
                  ],
                );
              },
              childCount: exerciseEntries.length,
            ),
          )
        ],
      ),
    );
  }
}
