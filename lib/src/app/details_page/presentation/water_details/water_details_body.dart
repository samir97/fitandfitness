import 'package:fitandfitness/src/app/details_page/presentation/details_empty_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/water_details/water_details_tile.dart';
import 'package:fitandfitness/src/app/details_page/presentation/water_details/water_details_trend.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaterDetailsBody extends ConsumerWidget {
  final BuildContext cupertinoContext;
  final List<Water> waterEntries;

  const WaterDetailsBody({
    super.key,
    required this.cupertinoContext,
    required this.waterEntries,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (waterEntries.isEmpty) {
      return const DetailsEmptyScreen(entryType: EntryType.water);
    }

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WaterDetailsTrend(waterEntries: waterEntries),
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
                    WaterDetailTile(
                      cupertinoContext: cupertinoContext,
                      water: waterEntries[index],
                    ),
                    if (index != waterEntries.length - 1)
                      const Divider(
                        height: 0,
                      ),
                  ],
                );
              },
              childCount: waterEntries.length,
            ),
          )
        ],
      ),
    );
  }
}
