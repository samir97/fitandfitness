import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_filter_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/cardio/cardio_filtered_list.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/exercise_tabbed_list.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/state/exercise_filters.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_filter_screen.dart';
import 'package:fitandfitness/src/app/data_entry/presentation/exercise/strength/strength_filtered_list.dart';
import 'package:fitandfitness/src/models/exercise/exercise_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExerciseEntryScreen extends ConsumerStatefulWidget {
  const ExerciseEntryScreen({
    super.key,
    required this.cupertinoContext,
    required this.exerciseType,
    this.fromDetailsPage = false,
  });

  final BuildContext cupertinoContext;
  final ExerciseType exerciseType;
  final bool fromDetailsPage;

  @override
  ConsumerState<ExerciseEntryScreen> createState() =>
      _ExerciseEntryScreenState();
}

class _ExerciseEntryScreenState extends ConsumerState<ExerciseEntryScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool showFilterBadge() {
      if (widget.exerciseType == ExerciseType.cardio) {
        return ref.watch(cardioActivityFilter).isNotEmpty;
      } else {
        return (ref.watch(experienceLevelFilter).isNotEmpty ||
            ref.watch(muscleGroupFilter).isNotEmpty ||
            ref.watch(motionTypeFilter).isNotEmpty);
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: widget.fromDetailsPage ? 8.0 : 0.0),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 48,
          title: CupertinoSearchTextField(
            focusNode: _focusNode,
            onChanged: (value) =>
                ref.read(exerciseSearch.notifier).state = value,
            placeholder: (widget.exerciseType == ExerciseType.cardio)
                ? "Search cardio exercises"
                : "Search strength exercises",
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded),
            tooltip: "Back",
          ),
          actions: [
            IconButton(
              onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                expand: true,
                context: widget.cupertinoContext,
                builder: (context) =>
                    (widget.exerciseType == ExerciseType.cardio)
                        ? const CardioFilterScreen()
                        : const StrengthFilterScreen(),
              ),
              icon: Badge(
                smallSize: 10,
                isLabelVisible: showFilterBadge(),
                child: const Icon(Icons.filter_list),
              ),
              tooltip: "Filter",
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => _focusNode.unfocus(),
          child: (ref.watch(exerciseSearch).isNotEmpty || showFilterBadge())
              ? (widget.exerciseType == ExerciseType.cardio)
                  ? CardioFilteredList(
                      cupertinoContext: widget.cupertinoContext)
                  : StrengthFilteredList(
                      cupertinoContext: widget.cupertinoContext)
              : ExerciseTabbedList(
                  exerciseType: widget.exerciseType,
                  cupertinoContext: widget.cupertinoContext,
                  focusNode: _focusNode,
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
