import 'package:animations/animations.dart';
import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/state/current_overview_date.dart';
import 'package:fitandfitness/src/app/details_page/presentation/sleep_details_screen.dart';
import 'package:fitandfitness/src/data/controllers/sleep_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/sleep/sleep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SleepWidget extends StatelessWidget {
  const SleepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: OpenContainer(
        closedColor: Theme.of(context).cardColor,
        closedBuilder: (BuildContext c, VoidCallback action) =>
            SleepWidgetContents(
          action: action,
        ),
        openBuilder: (BuildContext c, VoidCallback action) =>
            const SleepDetailsScreen(),
        tappable: true,
      ),
    );
  }
}

class SleepWidgetContents extends ConsumerWidget {
  final VoidCallback action;

  const SleepWidgetContents({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewDate = ref.watch(currentOverviewDateProvider);
    final sleepController = ref.watch(sleepControllerProvider);

    return InkWell(
      onTap: action,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              color: Colors.purple.withValues(alpha:0.15),
              constraints: const BoxConstraints.expand(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: sleepController.when(
                data: (sleepEntries) => SleepWidgetBody(
                  overviewDate: overviewDate.dateTime,
                  sleepEntries: sleepEntries,
                ),
                loading: () => FilledWidget(
                  overviewDate: overviewDate.dateTime,
                  child: Shimmer.fromColors(
                    baseColor: Colors.purple.withValues(alpha:0.15),
                    highlightColor: Colors.purple.withValues(alpha:0.25),
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
                        EntryType.sleep.errorStateMessage,
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
          child: SleepWidgetBody(
            overviewDate: overviewDate,
            sleepEntries: const [],
          ),
        ),
      ],
    );
  }
}

class SleepWidgetBody extends StatelessWidget {
  const SleepWidgetBody({
    super.key,
    required this.overviewDate,
    required this.sleepEntries,
  });

  final DateTime overviewDate;
  final List<Sleep> sleepEntries;

  @override
  Widget build(BuildContext context) {
    final filteredSleepEntries = sleepEntries
        .where(
          (entry) => DateUtils.isSameDay(entry.recordedAt, overviewDate),
        )
        .sortedBy((entry) => entry.recordedAt)
        .toList();

    final totalSleepDuration = filteredSleepEntries
        .map((entry) => entry.recordedAt.difference(entry.sleptAt))
        .fold(
          Duration.zero,
          (previousValue, element) => previousValue + element,
        );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sleep',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '${totalSleepDuration.inHours}h ${totalSleepDuration.inMinutes % 60}m',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SleepList(
            sleepEntries: filteredSleepEntries,
          ),
        ],
      ),
    );
  }
}

class SleepList extends StatelessWidget {
  final List<Sleep> sleepEntries;

  const SleepList({
    super.key,
    required this.sleepEntries,
  });

  @override
  Widget build(BuildContext context) {
    if (sleepEntries.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'No sleep recorded today',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < sleepEntries.length; i++)
          ..._buildSleepEntry(context, sleepEntries[i],
              isLast: i == sleepEntries.length - 1),
      ],
    );
  }

  List<Widget> _buildSleepEntry(BuildContext context, Sleep entry,
      {bool isLast = false}) {
    final sleptAt = DateFormat('HH:mm').format(entry.sleptAt);
    final wokeUpAt = DateFormat('HH:mm').format(entry.recordedAt);

    final sleepDuration = entry.recordedAt.difference(entry.sleptAt);

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$sleptAt to $wokeUpAt",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            (sleepDuration.inMinutes < 60)
                ? "${sleepDuration.inMinutes}m"
                : "${sleepDuration.inHours}h ${sleepDuration.inMinutes % 60}m",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
      if (!isLast) const Divider(),
    ];
  }
}
