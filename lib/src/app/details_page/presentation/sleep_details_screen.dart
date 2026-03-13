import 'package:fitandfitness/src/app/data_entry/presentation/sleep/sleep_entry_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_empty_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_error_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_template_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/trend_chart.dart';
import 'package:fitandfitness/src/app/details_page/state/trend_range.dart';
import 'package:fitandfitness/src/data/controllers/sleep_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:fitandfitness/src/models/sleep/sleep.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

enum SleepProperties { duration, quality }

class SleepDetailsScreen extends ConsumerWidget {
  const SleepDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepController = ref.watch(sleepControllerProvider);

    return DetailsTemplateScreen(
      builder: (cupertinoContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sleep'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    CupertinoScaffold.showCupertinoModalBottomSheet(
                  expand: true,
                  enableDrag: false,
                  context: cupertinoContext,
                  builder: (context) => const SleepEntryScreen(),
                ),
                tooltip: 'Add',
              )
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: sleepController.when(
              data: (sleepEntries) => _SleepDetailsBody(
                cupertinoContext: cupertinoContext,
                sleepEntries: sleepEntries,
              ),
              loading: () => const DetailsShimmerScreen(),
              error: (e, st) => const DetailsErrorScreen(
                entryType: EntryType.sleep,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SleepDetailsBody extends ConsumerStatefulWidget {
  const _SleepDetailsBody({
    required this.cupertinoContext,
    required this.sleepEntries,
  });

  final BuildContext cupertinoContext;
  final List<Sleep> sleepEntries;

  @override
  ConsumerState<_SleepDetailsBody> createState() => _SleepDetailsBodyState();
}

class _SleepDetailsBodyState extends ConsumerState<_SleepDetailsBody> {
  late SleepProperties _sleepPropertiesSelector;

  @override
  void initState() {
    super.initState();

    _sleepPropertiesSelector = SleepProperties.duration;
  }

  @override
  Widget build(BuildContext context) {
    String unitsLabel = "Hours";
    final trendRange = ref.watch(trendRangeProvider);
    final now = DateTime.now();
    final endRangeDate = DateTime(now.year, now.month, now.day);
    final startRangeDate = endRangeDate.subtract(trendRange);

    if (widget.sleepEntries.isEmpty) {
      return const DetailsEmptyScreen(entryType: EntryType.sleep);
    }

    Iterable<Sleep> sleepEntries = widget.sleepEntries.where(
      (sleep) =>
          (sleep.recordedAt.isAfter(startRangeDate) ||
              DateUtils.isSameDay(sleep.recordedAt, startRangeDate)) &&
          (sleep.recordedAt.isBefore(endRangeDate) ||
              DateUtils.isSameDay(sleep.recordedAt, endRangeDate)),
    );

    List<TrendData> values = [];

    if (_sleepPropertiesSelector == SleepProperties.duration) {
      unitsLabel = "Hours";
      values = sleepEntries.map(
        (sleep) {
          final duration = sleep.recordedAt.difference(sleep.sleptAt);
          return TrendData(
            duration.inHours.toDouble(),
            sleep.recordedAt,
          );
        },
      ).toList();
    } else if (_sleepPropertiesSelector == SleepProperties.quality) {
      unitsLabel = "Quality";
      values = sleepEntries
          .map((sleep) => TrendData(
                sleep.sleepQuality.index.toDouble(),
                sleep.recordedAt,
              ))
          .toList();
    }

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                child: CupertinoSlidingSegmentedControl<SleepProperties>(
                  backgroundColor: CupertinoColors.systemGrey2,
                  thumbColor: Colors.purple,
                  groupValue: _sleepPropertiesSelector,
                  onValueChanged: (SleepProperties? sleepProperty) async {
                    if (sleepProperty != null) {
                      setState(
                        () => _sleepPropertiesSelector = sleepProperty,
                      );
                    }
                  },
                  children: const <SleepProperties, Widget>{
                    SleepProperties.duration: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Duration',
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                    SleepProperties.quality: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Quality',
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TrendChart(
              color: Colors.purple,
              unitsLabel: unitsLabel,
              values: values,
              calculateAverage:
                  (_sleepPropertiesSelector == SleepProperties.quality),
              axisAnnotation:
                  (_sleepPropertiesSelector == SleepProperties.quality)
                      ? ["Pos", "Avg", "Neg"]
                      : null,
              defaultMinY: (_sleepPropertiesSelector == SleepProperties.quality)
                  ? 0
                  : null,
              defaultMaxY: (_sleepPropertiesSelector == SleepProperties.quality)
                  ? 4
                  : null,
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
                    SleepDetailTile(
                      cupertinoContext: widget.cupertinoContext,
                      sleep: widget.sleepEntries[index],
                    ),
                    if (index != widget.sleepEntries.length - 1)
                      const Divider(
                        height: 0,
                      ),
                  ],
                );
              },
              childCount: widget.sleepEntries.length,
            ),
          )
        ],
      ),
    );
  }
}

class SleepDetailTile extends ConsumerWidget {
  const SleepDetailTile({
    super.key,
    required this.cupertinoContext,
    required this.sleep,
  });

  final BuildContext cupertinoContext;
  final Sleep sleep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    DateFormat dateFormatter = DateFormat.yMMMd(locale.toString());
    DateFormat timeFormatter = DateFormat.Hm(locale.toString());

    final sleepHours = sleep.recordedAt.difference(sleep.sleptAt).inHours;
    final sleepMinutes = sleep.recordedAt.difference(sleep.sleptAt).inMinutes;

    return Slidable(
      key: ValueKey(sleep.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(onDismissed: () => deleteEntry(ref)),
        children: [
          SlidableAction(
            onPressed: (context) => deleteEntry(ref),
            backgroundColor: CupertinoColors.destructiveRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${sleepHours}h ${sleepMinutes % 60}m',
            ),
            Text(sleep.sleepQuality.toString())
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${dateFormatter.format(sleep.recordedAt)} at ${timeFormatter.format(sleep.recordedAt)}',
            ),
            if (sleep.notes != null)
              const Icon(
                Icons.notes_rounded,
                size: 16,
              ),
          ],
        ),
        onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
          expand: true,
          enableDrag: false,
          context: cupertinoContext,
          builder: (context) => SleepEntryScreen(
            sleep: sleep,
          ),
        ),
      ),
    );
  }

  void deleteEntry(WidgetRef ref) {
    final sleepController = ref.read(sleepControllerProvider.notifier);
    sleepController.deleteEntry(sleep.id!);
  }
}
