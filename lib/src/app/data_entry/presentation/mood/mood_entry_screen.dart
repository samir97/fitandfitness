import 'dart:io';

import 'package:fitandfitness/src/app/data_entry/presentation/delete_entry_button.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_activity_page.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_selector_page.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_sentiment_page.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/mood_summary_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/mood/state/mood_entry.dart';
import 'package:fitandfitness/src/data/controllers/mood_controller.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MoodEntryScreen extends ConsumerStatefulWidget {
  const MoodEntryScreen({
    super.key,
    this.mood,
  });

  final Mood? mood;

  @override
  ConsumerState<MoodEntryScreen> createState() => _MoodEntryScreenState();
}

class _MoodEntryScreenState extends ConsumerState<MoodEntryScreen> {
  late int _page;
  late PageController _pageController;

  bool _deleteRecordedPhoto = false;
  XFile? _photo;

  @override
  void initState() {
    super.initState();

    if (widget.mood == null) {
      _page = 0;
      _pageController = PageController();
    } else {
      _page = 3;
      _pageController = PageController(initialPage: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final moodEntry = ref.watch(moodEntryProvider(mood: widget.mood));
    final disableNextPageButton =
        (_page == 1 && moodEntry.moodActivities.isEmpty) ||
            (_page == 2 && moodEntry.moodSentiments.isEmpty);

    return CupertinoScaffold(
      body: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: (_page == 0 || _page == 3)
                    ? IconButton(
                        key: UniqueKey(),
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    : IconButton(
                        onPressed: () => setState(
                          () {
                            _pageController.animateToPage(
                              (_page - 1) % 4,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOutQuint,
                            );
                            _page--;
                          },
                        ),
                        icon: Icon(
                          key: UniqueKey(),
                          Icons.adaptive.arrow_back_rounded,
                        ),
                      ),
              ),
              title: (widget.mood == null)
                  ? const Text('Add Mood')
                  : const Text('Edit Mood'),
              actions: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: (_page == 0)
                      ? const SizedBox()
                      : (_page == 3)
                          ? IconButton(
                              icon: const Icon(Icons.done_rounded),
                              onPressed: () {
                                if (_photo != null) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text("Saving Photo..."),
                                      content: AspectRatio(
                                        aspectRatio: 1.5,
                                        child: !Platform.isIOS
                                            ? const CupertinoActivityIndicator()
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ),
                                    ),
                                  );
                                }

                                ref
                                    .read(moodControllerProvider.notifier)
                                    .addOrUpdateEntry(
                                      moodEntry,
                                      photo: _photo,
                                      deleteRecordedPhoto: _deleteRecordedPhoto,
                                    )
                                    .then(
                                  (_) {
                                    if (_photo != null && context.mounted) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ).onError(
                                  (_, __) {
                                    if (_photo != null && context.mounted) {
                                      Navigator.of(context).pop();
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) =>
                                            const AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                            "An error occurred while saving the photo, please try again.",
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );

                                if (_photo == null) Navigator.of(context).pop();
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.close_rounded),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                ),
              ],
            ),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MoodSelectorPage(
                  mood: widget.mood,
                ),
                MoodActivityPage(
                  mood: widget.mood,
                ),
                MoodSentimentPage(
                  mood: widget.mood,
                ),
                MoodSummaryScreen(
                  mood: widget.mood,
                  navigateToPage: (page) {
                    setState(() => _page = page);
                    return _pageController.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                  onPhotoPicked: (photo) {
                    _photo = null;
                    _deleteRecordedPhoto = true;
                    _photo = photo;
                  },
                  onPhotoDelete: () {
                    _photo = null;
                    _deleteRecordedPhoto = true;
                  },
                ),
              ],
            ),
            floatingActionButton: (_page == 3)
                ? null
                : FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: disableNextPageButton
                        ? CupertinoColors.inactiveGray
                        : Colors.red,
                    onPressed: disableNextPageButton
                        ? null
                        : () {
                            _pageController.animateToPage(
                              (_page + 1) % 4,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOutQuint,
                            );
                            setState(() => _page++);
                          },
                    child: Icon(Icons.adaptive.arrow_forward_rounded,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
            bottomNavigationBar: (widget.mood?.id == null || _page != 3)
                ? null
                : DeleteEntryButton(
                    onDelete: () => ref
                        .read(moodControllerProvider.notifier)
                        .deleteEntry(widget.mood!),
                  ),
          );
        },
      ),
    );
  }
}
