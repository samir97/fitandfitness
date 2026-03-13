import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/data_entry/application/strength_exercise_provider.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_strength_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_strength_controller.dart';
import 'package:fitandfitness/src/data/repositories/exercise/strength_repository.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final strengthControllerProvider =
    AsyncNotifierProvider<StrengthController, List<Strength>>(
        StrengthController.new);

class StrengthController extends AsyncNotifier<List<Strength>> {
  @override
  FutureOr<List<Strength>> build() => getEntries();

  Future<List<Strength>> getEntries() async {
    try {
      final strengthRepository = ref.read(strengthRepositoryProvider);
      final strengthEntries = await strengthRepository?.getEntries() ?? [];

      strengthEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return strengthEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> _updateEntry(Strength strength) async {
    final strengthRepository = ref.read(strengthRepositoryProvider);
    strengthRepository?.updateEntry(strength);

    state.whenData(
      (strengthEntries) {
        final updatedStrengthEntries = [
          for (final strengthEntry in strengthEntries)
            if (strengthEntry.id == strength.id) strength else strengthEntry
        ];

        updatedStrengthEntries
            .sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

        state = AsyncValue.data(updatedStrengthEntries);
      },
    );
  }

  Future<void> addOrUpdateEntry(Strength strength) async {
    final exercise = ref.watch(strengthExerciseProvider).firstWhereOrNull(
          (strengthExercise) =>
              strength.exercise.name.toLowerCase() ==
              strengthExercise.name.toLowerCase(),
        );

    ref
        .read(recentStrengthControllerProvider.notifier)
        .addOrUpdateEntry(strength.exercise);

    if (exercise == null && !strength.exercise.isPreset) {
      ref
          .read(customStrengthControllerProvider.notifier)
          .addOrUpdateEntry(strength.exercise);
    }

    if (strength.id == null) {
      final strengthRepository = ref.read(strengthRepositoryProvider);
      final id = await strengthRepository?.addEntry(strength);

      state.whenData(
        (strengthEntries) {
          strengthEntries.add(strength.copyWith(id: id));
          strengthEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
          return state = AsyncValue.data(strengthEntries);
        },
      );
    } else {
      _updateEntry(strength);
    }
  }

  Future<void> deleteEntry(String id) async {
    final strengthRepository = ref.read(strengthRepositoryProvider);
    await strengthRepository?.deleteEntry(id);
    state.whenData(
      (strengthEntries) {
        strengthEntries.removeWhere((strength) => strength.id == id);
        state = AsyncValue.data(strengthEntries);
      },
    );
  }
}
