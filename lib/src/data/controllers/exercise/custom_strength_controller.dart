import 'dart:async';

import 'package:fitandfitness/src/data/repositories/exercise/strength_exercise_repository.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customStrengthControllerProvider =
    AsyncNotifierProvider<CustomStrengthController, List<StrengthExercise>>(
        CustomStrengthController.new);

class CustomStrengthController extends AsyncNotifier<List<StrengthExercise>> {
  @override
  FutureOr<List<StrengthExercise>> build() => getEntries();

  Future<List<StrengthExercise>> getEntries() async {
    final strengthRepository = ref.read(customStrengthRepositoryProvider);

    return await strengthRepository?.getEntries() ?? [];
  }

  Future<void> addOrUpdateEntry(StrengthExercise strengthExercise) async {
    final strengthRepository = ref.read(customStrengthRepositoryProvider);
    final updatedStrengthExercise = strengthExercise.copyWith(
      recordedAt: DateTime.now(),
    );

    await strengthRepository?.addEntry(updatedStrengthExercise);

    state.whenData(
      (strengthEntries) => state = AsyncValue.data(
        strengthEntries
          ..removeWhere((strengthExercise) =>
              strengthExercise.name == updatedStrengthExercise.name)
          ..add(
            updatedStrengthExercise,
          ),
      ),
    );
  }

  Future<void> deleteEntry(String name) async {
    final strengthRepository = ref.read(customStrengthRepositoryProvider);

    await strengthRepository?.deleteEntry(name);

    state.whenData(
      (strengthEntries) {
        strengthEntries
            .removeWhere((strengthExercise) => strengthExercise.name == name);
        state = AsyncValue.data(strengthEntries);
      },
    );
  }
}
