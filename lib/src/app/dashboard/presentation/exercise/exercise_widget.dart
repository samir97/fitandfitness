import 'package:animations/animations.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/exercise/exercise_widget_body.dart';
import 'package:fitandfitness/src/app/dashboard/presentation/state/current_overview_date.dart';
import 'package:fitandfitness/src/app/details_page/presentation/exercise_details/exercise_details_screen.dart';
import 'package:fitandfitness/src/data/controllers/exercise/exercise_controller.dart';
import 'package:fitandfitness/src/models/entry_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: OpenContainer(
        closedColor: Theme.of(context).cardColor,
        closedBuilder: (BuildContext c, VoidCallback action) =>
            ExerciseWidgetContents(
          action: action,
        ),
        openBuilder: (BuildContext c, VoidCallback action) =>
            const ExerciseDetailsScreen(),
        tappable: true,
      ),
    );
  }
}

class ExerciseWidgetContents extends ConsumerWidget {
  final VoidCallback action;

  const ExerciseWidgetContents({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewDate = ref.watch(currentOverviewDateProvider);
    final exerciseController = ref.watch(exerciseControllerProvider);

    return InkWell(
      onTap: action,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              color: Colors.yellow.shade700.withValues(alpha:0.15),
              constraints: const BoxConstraints.expand(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: exerciseController.when(
                data: (exerciseEntries) => ExerciseWidgetBody(
                  overviewDate: overviewDate.dateTime,
                  exerciseEntries: exerciseEntries,
                ),
                loading: () => FilledWidget(
                  overviewDate: overviewDate.dateTime,
                  child: Shimmer.fromColors(
                    baseColor: Colors.yellow.shade700.withValues(alpha:0.15),
                    highlightColor: Colors.yellow.shade700.withValues(alpha:0.25),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
                error: (e, st) => FilledWidget(
                  overviewDate: overviewDate.dateTime,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        EntryType.exercise.errorStateMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilledWidget extends StatelessWidget {
  const FilledWidget({
    super.key,
    required this.overviewDate,
    required this.child,
  });

  final DateTime overviewDate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Opacity(
          opacity: 0.0,
          child: ExerciseWidgetBody(
            overviewDate: overviewDate,
            exerciseEntries: const [],
          ),
        ),
      ],
    );
  }
}
