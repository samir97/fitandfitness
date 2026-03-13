import 'package:fitandfitness/src/app/details_page/presentation/details_empty_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/mood_details/mood_details_tile.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodDetailsBody extends ConsumerWidget {
  const MoodDetailsBody({
    super.key,
    required this.cupertinoContext,
    required this.moodEntries,
  });

  final BuildContext cupertinoContext;
  final List<Mood> moodEntries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    if (moodEntries.isEmpty) {
      return const DetailsEmptyScreen(entryType: EntryType.mood);
    }

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TrendChart(
              color: Colors.red,
              unitsLabel: 'Sentiment',
              calculateAverage: true,
              defaultMinY: 0,
              defaultMaxY: 4,
              axisAnnotation: const ['Pos', 'Avg', 'Neg'],
              values: moodEntries
                  .where(
                    (mood) =>
                        (mood.recordedAt.isAfter(startRangeDate) ||
                            DateUtils.isSameDay(
                                mood.recordedAt, startRangeDate)) &&
                        (mood.recordedAt.isBefore(endRangeDate) ||
                            DateUtils.isSameDay(mood.recordedAt, endRangeDate)),
                  )
                  .map(
                    (mood) => TrendData(
                      mood.moodLevel.index.toDouble(),
                      mood.recordedAt,
                    ),
                  )
                  .toList(),
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
                    MoodDetailTile(
                      cupertinoContext: cupertinoContext,
                      mood: moodEntries[index],
                    ),
                    if (index != moodEntries.length - 1)
                      const Divider(
                        height: 0,
                      ),
                  ],
                );
              },
              childCount: moodEntries.length,
            ),
          )
        ],
      ),
    );
  }
}
