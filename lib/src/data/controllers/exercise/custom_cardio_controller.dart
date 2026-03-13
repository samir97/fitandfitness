import 'dart:async';

import 'package:fitandfitness/src/data/repositories/exercise/cardio_exercise_repository.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customCardioControllerProvider =
    AsyncNotifierProvider<CustomCardioController, List<CardioExercise>>(
        CustomCardioController.new);

class CustomCardioController extends AsyncNotifier<List<CardioExercise>> {
  @override
  FutureOr<List<CardioExercise>> build() => getEntries();

  Future<List<CardioExercise>> getEntries() async {
    final cardioRepository = ref.read(customCardioRepositoryProvider);

    return await cardioRepository?.getEntries() ?? [];
  }

  Future<void> addOrUpdateEntry(CardioExercise cardioExercise) async {
    final cardioRepository = ref.read(customCardioRepositoryProvider);

    final updatedCardioExercise = cardioExercise.copyWith(
      recordedAt: DateTime.now(),
    );

    await cardioRepository?.addEntry(updatedCardioExercise);

    state.whenData(
      (cardioEntries) => state = AsyncValue.data(
        cardioEntries
          ..removeWhere((cardioExercise) =>
              cardioExercise.name == updatedCardioExercise.name)
          ..add(
            updatedCardioExercise,
          ),
      ),
    );
  }

  Future<void> deleteEntry(String name) async {
    final cardioRepository = ref.read(customCardioRepositoryProvider);

    await cardioRepository?.deleteEntry(name);

    state.whenData(
      (cardioEntries) {
        cardioEntries
            .removeWhere((cardioExercise) => cardioExercise.name == name);
        state = AsyncValue.data(cardioEntries);
      },
    );
  }
}
