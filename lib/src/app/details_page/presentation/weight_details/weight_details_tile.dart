import 'package:fitandfitness/src/app/data_entry/presentation/weight/weight_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/shimmer_cached_network_image.dart';
import 'package:fitandfitness/src/common_widgets/weight/display/weight_display.dart';
import 'package:fitandfitness/src/data/controllers/weight_controller.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WeightDetailsTile extends ConsumerWidget {
  const WeightDetailsTile({
    super.key,
    required this.cupertinoContext,
    required this.weight,
    required this.isLastEntry,
  });

  final BuildContext cupertinoContext;
  final Weight weight;
  final bool isLastEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    DateFormat dateFormatter = DateFormat.yMMMd(locale.toString());
    DateFormat timeFormatter = DateFormat.Hm(locale.toString());

    return Slidable(
      key: ValueKey(weight.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dragDismissible: !isLastEntry,
        dismissible: DismissiblePane(
            onDismissed: () => ref
                .read(weightControllerProvider.notifier)
                .deleteEntry(context, weight)),
        children: [
          SlidableAction(
            onPressed: (context) => ref
                .read(weightControllerProvider.notifier)
                .deleteEntry(context, weight),
            backgroundColor: CupertinoColors.destructiveRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          CupertinoScaffold.showCupertinoModalBottomSheet(
            expand: true,
            context: cupertinoContext,
            builder: (context) => WeightEntryScreen(
              weight: weight,
              isLastEntry: isLastEntry,
            ),
          );
        },
        title: Row(
          children: [
            WeightDisplay(weight.weight),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${dateFormatter.format(weight.recordedAt)} at ${timeFormatter.format(weight.recordedAt)}'),
            if (weight.notes != null)
              const Icon(
                Icons.notes_rounded,
                size: 16,
              ),
          ],
        ),
        trailing: (weight.progressPhotos ?? []).isEmpty
            ? null
            : ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ShimmerCachedNetworkImage(
                    imageUrl: weight.progressPhotosSmall?.first.url ?? '',
                    showMessage: false,
                  ),
                ),
              ),
      ),
    );
  }
}
