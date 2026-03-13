import 'dart:async';

import 'package:fitandfitness/src/data/controllers/exercise/cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/strength_controller.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/models/exercise/exercise.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseControllerProvider =
    AsyncNotifierProvider<ExerciseController, List<ExerciseEntry>>(
        ExerciseController.new);

class ExerciseController extends AsyncNotifier<List<ExerciseEntry>> {
  @override
  FutureOr<List<ExerciseEntry>> build() async {
    try {
      final cardioEntries = await ref.watch(cardioControllerProvider.future);
      final strengthEntries =
          await ref.watch(strengthControllerProvider.future);

      final exerciseEntries = [...cardioEntries, ...strengthEntries];

      exerciseEntries.sort(
        (a, b) => b.recordedAt.compareTo(a.recordedAt),
      );

      state = AsyncValue.data(exerciseEntries);
      return exerciseEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    ref.invalidate(cardioControllerProvider);
    ref.invalidate(strengthControllerProvider);

    state = const AsyncValue.loading();
    state = AsyncValue.data(await build());
  }

  Future<void> deleteEntry(ExerciseEntry exercise) async {
    final exerciseEntry = exercise;

    if (exerciseEntry.id == null) return;

    if (exerciseEntry is Cardio) {
      ref
          .read(cardioControllerProvider.notifier)
          .deleteEntry(exerciseEntry.id!);
    } else if (exerciseEntry is Strength) {
      ref
          .read(strengthControllerProvider.notifier)
          .deleteEntry(exerciseEntry.id!);
    }
  }
}
