import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_all_exercise_list.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_custom_list.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_recent_list.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_all_exercise_list.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_strength_controller.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseTabbedList extends ConsumerStatefulWidget {
  const ExerciseTabbedList({
    super.key,
    required this.exerciseType,
    required this.cupertinoContext,
    required this.focusNode,
  });

  final ExerciseType exerciseType;
  final BuildContext cupertinoContext;
  final FocusNode focusNode;

  @override
  ConsumerState<ExerciseTabbedList> createState() => _TabbedExerciseListState();
}

class _TabbedExerciseListState extends ConsumerState<ExerciseTabbedList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    )..addListener(() {
        if (_tabController.indexIsChanging) widget.focusNode.unfocus();
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.exerciseType == ExerciseType.cardio) {
      ref.watch(recentCardioControllerProvider).whenData(
        (value) {
          if (value.isNotEmpty) _tabController.animateTo(0);
        },
      );
    } else {
      ref.watch(recentStrengthControllerProvider).whenData(
        (value) {
          if (value.isNotEmpty) _tabController.animateTo(0);
        },
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orangeAccent,
          tabs: [
            Tab(
              icon: Text(
                'Recents',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Tab(
              icon: Text(
                'All Exercises',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Tab(
              icon: Text(
                'My Exercises',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: TabBarView(
            controller: _tabController,
            children: (widget.exerciseType == ExerciseType.cardio)
                ? [
                    ExerciseRecentList(
                      cupertinoContext: widget.cupertinoContext,
                      exerciseType: ExerciseType.cardio,
                    ),
                    CardioAllExercisesList(
                      cupertinoContext: widget.cupertinoContext,
                    ),
                    ExerciseCustomList(
                      cupertinoContext: widget.cupertinoContext,
                      exerciseType: ExerciseType.cardio,
                    ),
                  ]
                : [
                    ExerciseRecentList(
                      cupertinoContext: widget.cupertinoContext,
                      exerciseType: ExerciseType.strength,
                    ),
                    StrengthAllExercisesList(
                      cupertinoContext: widget.cupertinoContext,
                    ),
                    ExerciseCustomList(
                      cupertinoContext: widget.cupertinoContext,
                      exerciseType: ExerciseType.strength,
                    ),
                  ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
