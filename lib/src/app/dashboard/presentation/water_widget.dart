import 'package:animations/animations.dart';
import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/state/current_overview_date.dart';
import 'package:fitandfitness/src/app/details_page/presentation/water_details/water_details_screen.dart';
import 'package:fitandfitness/src/common_widgets/water/display/water_display.dart';
import 'package:fitandfitness/src/data/controllers/water_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

class WaterWidget extends StatelessWidget {
  const WaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: OpenContainer(
        closedColor: Theme.of(context).cardColor,
        closedBuilder: (BuildContext c, VoidCallback action) =>
            WaterWidgetContents(
          action: action,
        ),
        openBuilder: (BuildContext c, VoidCallback action) =>
            const WaterDetailsScreen(),
        tappable: true,
      ),
    );
  }
}

class WaterWidgetContents extends ConsumerWidget {
  final VoidCallback action;

  const WaterWidgetContents({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewDate = ref.watch(currentOverviewDateProvider);
    final waterController = ref.watch(waterControllerProvider);

    return InkWell(
      onTap: action,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              color: Colors.blue.withValues(alpha:0.15),
              constraints: const BoxConstraints.expand(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: waterController.when(
                data: (waterEntries) => WaterWidgetBody(
                  overviewDate: overviewDate.dateTime,
                  waterEntries: waterEntries,
                ),
                loading: () => FilledWidget(
                  overviewDate: overviewDate.dateTime,
                  child: Shimmer.fromColors(
                    baseColor: Colors.blue.withValues(alpha:0.15),
                    highlightColor: Colors.blue.withValues(alpha:0.25),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                error: (e, st) => FilledWidget(
                  overviewDate: overviewDate.dateTime,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        EntryType.water.errorStateMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilledWidget extends StatelessWidget {
  const FilledWidget({
    super.key,
    required this.overviewDate,
    required this.child,
  });

  final DateTime overviewDate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Opacity(
          opacity: 0.0,
          child: WaterWidgetBody(
            overviewDate: overviewDate,
            waterEntries: const [],
          ),
        ),
      ],
    );
  }
}

class WaterWidgetBody extends StatelessWidget {
  const WaterWidgetBody({
    super.key,
    required this.overviewDate,
    required this.waterEntries,
  });

  final DateTime overviewDate;
  final List<Water> waterEntries;

  @override
  Widget build(BuildContext context) {
    final filteredWaterEntries = waterEntries
        .where(
          (entry) => DateUtils.isSameDay(entry.recordedAt, overviewDate),
        )
        .sortedBy((entry) => entry.recordedAt)
        .toList();

    double totalWater = 0.0;
    List<String> completedGlassTimes = [];

    for (final entry in filteredWaterEntries) {
      totalWater += entry.quantity;
      final numberOfCompletedGlasses =
          (totalWater ~/ 236.59) - completedGlassTimes.length;

      var formatter = DateFormat("HH:mm");

      final newCompletedGlassTimes = List.generate(
        numberOfCompletedGlasses,
        (index) => formatter.format(entry.recordedAt),
      );

      completedGlassTimes = [
        ...completedGlassTimes,
        ...newCompletedGlassTimes,
      ];
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Water',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              DefaultTextStyle.merge(
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                child: WaterDisplay(totalWater),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          DrinkListTile(
            time1:
                completedGlassTimes.isNotEmpty ? completedGlassTimes[0] : null,
            time2:
                completedGlassTimes.length >= 2 ? completedGlassTimes[1] : null,
            time3:
                completedGlassTimes.length >= 3 ? completedGlassTimes[2] : null,
          ),
          const Divider(
            height: 16,
          ),
          DrinkListTile(
            time1:
                completedGlassTimes.length >= 4 ? completedGlassTimes[3] : null,
            time2:
                completedGlassTimes.length >= 5 ? completedGlassTimes[4] : null,
            time3:
                completedGlassTimes.length >= 6 ? completedGlassTimes[5] : null,
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}

class DrinkListTile extends StatelessWidget {
  final String? time1;
  final String? time2;
  final String? time3;

  const DrinkListTile({
    super.key,
    this.time1,
    this.time2,
    this.time3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WaterProgressIcon(
          time: time1,
        ),
        const SizedBox(
          width: 16,
        ),
        WaterProgressIcon(
          time: time2,
        ),
        const SizedBox(
          width: 16,
        ),
        WaterProgressIcon(time: time3),
      ],
    );
  }
}

class WaterProgressIcon extends StatelessWidget {
  final String? time;

  const WaterProgressIcon({super.key, this.time});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            MdiIcons.cup,
            size: 24,
            color: (time == null) ? Colors.grey : Colors.blue,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            (time == null) ? "   ---" : time!,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
