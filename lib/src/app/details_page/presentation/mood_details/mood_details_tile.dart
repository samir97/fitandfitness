import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/shimmer_cached_network_image.dart';
import 'package:fitandfitness/src/data/controllers/mood_controller.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MoodDetailTile extends ConsumerWidget {
  const MoodDetailTile({
    super.key,
    required this.cupertinoContext,
    required this.mood,
  });

  final BuildContext cupertinoContext;
  final Mood mood;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context);
    DateFormat dateFormatter = DateFormat.yMMMd(locale.toString());
    DateFormat timeFormatter = DateFormat.Hm(locale.toString());

    return Slidable(
      key: ValueKey(mood.id),
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
        onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
          expand: true,
          context: cupertinoContext,
          builder: (context) => MoodEntryScreen(
            mood: mood,
          ),
        ),
        title: Row(
          children: [
            Text(
              mood.moodLevel.label,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${dateFormatter.format(mood.recordedAt)} at ${timeFormatter.format(mood.recordedAt)}',
            ),
            if (mood.notes != null)
              const Icon(
                Icons.notes_rounded,
                size: 16,
              ),
          ],
        ),
        trailing: (mood.progressPhotos ?? []).isEmpty
            ? null
            : ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ShimmerCachedNetworkImage(
                    imageUrl: mood.progressPhotosSmall?.first.url ?? '',
                    showMessage: false,
                  ),
                ),
              ),
      ),
    );
  }

  void deleteEntry(WidgetRef ref) {
    final moodController = ref.read(moodControllerProvider.notifier);
    moodController.deleteEntry(mood);
  }
}
