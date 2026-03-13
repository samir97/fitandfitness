import 'package:fitandfitness/src/app/data_entry/presentation/water/water_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/water/display/water_display.dart';
import 'package:fitandfitness/src/data/controllers/water_controller.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WaterDetailTile extends ConsumerWidget {
  const WaterDetailTile({
    super.key,
    required this.cupertinoContext,
    required this.water,
  });

  final BuildContext cupertinoContext;
  final Water water;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    DateFormat dateFormatter = DateFormat.yMMMd(locale.toString());
    DateFormat timeFormatter = DateFormat.Hm(locale.toString());

    return Slidable(
      key: ValueKey(water.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(
            onDismissed: () => ref
                .read(waterControllerProvider.notifier)
                .deleteEntry(water.id!)),
        children: [
          SlidableAction(
            onPressed: (_) => ref
                .read(waterControllerProvider.notifier)
                .deleteEntry(water.id!),
            backgroundColor: CupertinoColors.destructiveRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: WaterDisplay(water.quantity),
        subtitle: Text(
          '${dateFormatter.format(water.recordedAt)} at ${timeFormatter.format(water.recordedAt)}',
        ),
        onTap: () {
          CupertinoScaffold.showCupertinoModalBottomSheet(
            expand: true,
            context: cupertinoContext,
            builder: (context) => WaterEntryScreen(
              water: water,
            ),
          );
        },
      ),
    );
  }
}
