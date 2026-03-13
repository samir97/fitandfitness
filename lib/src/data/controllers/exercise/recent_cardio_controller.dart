import 'dart:async';

import 'package:fitandfitness/src/data/repositories/exercise/cardio_exercise_repository.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_cardio_controller.g.dart';

@riverpod
class RecentCardioController extends _$RecentCardioController {
  @override
  FutureOr<List<CardioExercise>> build() => getEntries();

  Future<List<CardioExercise>> getEntries() async {
    final cardioRepository = ref.read(recentCardioRepositoryProvider);

    return await cardioRepository?.getEntries() ?? [];
  }

  Future<void> addOrUpdateEntry(CardioExercise cardioExercise) async {
    final cardioRepository = ref.read(recentCardioRepositoryProvider);

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
    final cardioRepository = ref.read(recentCardioRepositoryProvider);

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
