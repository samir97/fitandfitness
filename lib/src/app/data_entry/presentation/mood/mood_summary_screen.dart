import 'package:fitandfitness/src/app/data_entry/presentation/notes_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/photo_list_tile.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/recorded_at_list_tile.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'state/mood_entry.dart';

class MoodSummaryScreen extends ConsumerStatefulWidget {
  const MoodSummaryScreen({
    super.key,
    this.mood,
    required this.navigateToPage,
    required this.onPhotoPicked,
    required this.onPhotoDelete,
  });

  final Mood? mood;
  final Function(int) navigateToPage;
  final Function(XFile?) onPhotoPicked;
  final Function onPhotoDelete;

  @override
  ConsumerState<MoodSummaryScreen> createState() => _MoodSummaryScreenState();
}

class _MoodSummaryScreenState extends ConsumerState<MoodSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final moodEntry = ref.watch(moodEntryProvider(mood: widget.mood));
    final moodEntryNotifier =
        ref.read(moodEntryProvider(mood: widget.mood).notifier);

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 16,
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Current mood"),
              Text(moodEntry.moodLevel.label),
            ],
          ),
          onTap: () => widget.navigateToPage(0),
        ),
        const Divider(
          height: 16,
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Activities"),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                alignment: WrapAlignment.start,
                children: moodEntry.moodActivities
                    .map(
                      (activity) => ActionChip(
                        label: Text("${activity.icon} $activity"),
                        onPressed: () => widget.navigateToPage(1),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        const Divider(
          height: 16,
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sentiments"),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                alignment: WrapAlignment.start,
                children: moodEntry.moodSentiments
                    .map((sentiment) => ActionChip(
                          label: Text("${sentiment.icon} $sentiment"),
                          onPressed: () => widget.navigateToPage(2),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        const Divider(
          height: 16,
        ),
        RecordedAtListTile(
          initialDateTime: moodEntry.recordedAt,
          onSave: moodEntryNotifier.updateRecordedAt,
        ),
        const Divider(
          height: 16,
        ),
        PhotoListTile(
          title: "Add a photo",
          recordedImage: moodEntry.progressPhotos?.firstOrNull?.url,
          onPhotoPicked: widget.onPhotoPicked,
          onPhotoDelete: widget.onPhotoDelete,
        ),
        const Divider(
          height: 16,
        ),
        NotesListTile(
          title: "Tell us more",
          body: moodEntry.notes,
          onSave: moodEntryNotifier.updateNotes,
        ),
      ],
    );
  }
}
