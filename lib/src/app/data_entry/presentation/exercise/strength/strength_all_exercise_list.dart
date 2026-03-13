import 'package:fitandfitness/src/app/data_entry/application/strength_exercise_provider.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_entry_screen.dart';
import 'package:fitandfitness/src/common_widgets/sticky_sub_list_header.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StrengthAllExercisesList extends ConsumerWidget {
  const StrengthAllExercisesList({
    super.key,
    required this.cupertinoContext,
  });

  final BuildContext cupertinoContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strengthExercises = [
      ref.read(abdominalsLowerStrengthExerciseProvider),
      ref.read(abdominalsObliquesStrengthExerciseProvider),
      ref.read(abdominalsTotalStrengthExerciseProvider),
      ref.read(abdominalsUpperStrengthExerciseProvider),
      ref.read(backLatissimusDorsiStrengthExerciseProvider),
      ref.read(backLatDorsiOrRhomboidsStrengthExerciseProvider),
      ref.read(bicepsStrengthExerciseProvider),
      ref.read(calvesGastrocnemiusStrengthExerciseProvider),
      ref.read(calvesSoleusStrengthExerciseProvider),
      ref.read(chestPectoralisStrengthExerciseProvider),
      ref.read(legsHamstringsStrengthExerciseProvider),
      ref.read(legsQuadricepsStrengthExerciseProvider),
      ref.read(lowerBackErectorSpinaeStrengthExerciseProvider),
      ref.read(shouldersDeltsOrTrapsStrengthExerciseProvider),
      ref.read(shouldersRotatorCuffStrengthExerciseProvider),
      ref.read(tricepsStrengthExerciseProvider),
    ];

    final firstMuscleGroups = strengthExercises.first.first.muscleGroups;

    return Scrollbar(
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          for (var strengthExerciseGroup in strengthExercises)
            StrengthExerciseSubList(
              cupertinoContext: cupertinoContext,
              title: strengthExerciseGroup.first.muscleGroups!.first.toString(),
              exercises: strengthExerciseGroup,
              addDivider: (firstMuscleGroups?.first !=
                  strengthExerciseGroup.first.muscleGroups?.first),
            ),
        ],
      ),
    );
  }
}

class StrengthExerciseSubList extends StatelessWidget {
  const StrengthExerciseSubList({
    super.key,
    required this.cupertinoContext,
    required this.title,
    required this.exercises,
    this.addDivider = true,
  });

  final BuildContext cupertinoContext;
  final String title;
  final List<StrengthExercise> exercises;
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
                    builder: (context) => StrengthEntryScreen(
                      strengthExercise: exercises[i],
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
