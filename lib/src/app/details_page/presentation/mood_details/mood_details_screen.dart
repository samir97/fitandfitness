import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_entry_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_error_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_shimmer_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/details_template_screen.dart';
import 'package:fitandfitness/src/app/details_page/presentation/mood_details/mood_details_body.dart';
import 'package:fitandfitness/src/data/controllers/mood_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MoodDetailsScreen extends ConsumerWidget {
  const MoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodController = ref.watch(moodControllerProvider);

    return DetailsTemplateScreen(
      builder: (cupertinoContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Mood'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: cupertinoContext,
                    builder: (context) => const MoodEntryScreen(),
                  );
                },
                tooltip: 'Add',
              )
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: moodController.when(
              data: (moodEntries) => MoodDetailsBody(
                cupertinoContext: cupertinoContext,
                moodEntries: moodEntries,
              ),
              loading: () => const DetailsShimmerScreen(),
              error: (e, st) => const DetailsErrorScreen(
                entryType: EntryType.mood,
              ),
            ),
          ),
        );
      },
    );
  }
}
