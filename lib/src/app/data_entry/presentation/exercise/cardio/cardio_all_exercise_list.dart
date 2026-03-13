import 'package:fitandfitness/src/app/data_entry/application/cardio_exercise_provider.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/sticky_sub_list_header.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CardioAllExercisesList extends ConsumerWidget {
  const CardioAllExercisesList({super.key, required this.cupertinoContext});

  final BuildContext cupertinoContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardioExercises = [
      ref.read(bicyclingCardioExerciseProvider),
      ref.read(conditioningCardioExerciseProvider),
      ref.read(dancingCardioExerciseProvider),
      ref.read(fishingCardioExerciseProvider),
      ref.read(gardeningCardioExerciseProvider),
      ref.read(musicPlayingCardioExerciseProvider),
      ref.read(occupationCardioExerciseProvider),
      ref.read(runningCardioExerciseProvider),
      ref.read(sportsPlayingCardioExerciseProvider),
      ref.read(walkingCardioExerciseProvider),
      ref.read(waterActivitiesCardioExerciseProvider),
      ref.read(winterActivitiesCardioExerciseProvider),
    ];

    final firstCardioActivity = cardioExercises.first.first.cardioActivity;

    return Scrollbar(
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          for (var cardioExerciseGroup in cardioExercises)
            CardioExerciseSubList(
              cupertinoContext: cupertinoContext,
              title: cardioExerciseGroup.first.cardioActivity.toString(),
              exercises: cardioExerciseGroup,
              addDivider: (firstCardioActivity !=
                  cardioExerciseGroup.first.cardioActivity),
            ),
        ],
      ),
    );
  }
}

class CardioExerciseSubList extends StatelessWidget {
  const CardioExerciseSubList({
    super.key,
    required this.cupertinoContext,
    required this.title,
    required this.exercises,
    this.addDivider = true,
  });

  final BuildContext cupertinoContext;
  final String title;
  final List<CardioExercise> exercises;
  final bool addDivider;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: StickySubListHeader(
        title: title,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Column(
            children: [
              ListTile(
                onTap: () {
                  CupertinoScaffold.showCupertinoModalBottomSheet(
                    expand: true,
                    context: cupertinoContext,
                    builder: (context) => CardioEntryScreen(
                      cardioExercise: exercises[i],
                    ),
                  );
                },
                title: Text(exercises[i].name),
              ),
              if (i == exercises.length - 1 && addDivider)
                const Divider(
                  height: 0,
                ),
            ],
          ),
          childCount: exercises.length,
        ),
      ),
    );
  }
}
