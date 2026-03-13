import 'package:fitandfitness/src/app/details_page/presentation/details_empty_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/weight_details/weight_details_tile.dart';
import 'package:fitandfitness/src/app/details_page/presentation/weight_details/weight_details_trend.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightDetailsBody extends ConsumerWidget {
  const WeightDetailsBody({
    super.key,
    required this.cupertinoContext,
    required this.weightEntries,
  });

  final BuildContext cupertinoContext;
  final List<Weight> weightEntries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (weightEntries.isEmpty) {
      return const DetailsEmptyScreen(entryType: EntryType.weight);
    }

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WeightDetailsTrend(
              weightEntries: weightEntries,
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
                    WeightDetailsTile(
                      cupertinoContext: cupertinoContext,
                      weight: weightEntries[index],
                      isLastEntry: weightEntries.length == 1,
                    ),
                    if (index != weightEntries.length - 1)
                      const Divider(
                        height: 0,
                      ),
                  ],
                );
              },
              childCount: weightEntries.length,
            ),
          )
        ],
      ),
    );
  }
}
