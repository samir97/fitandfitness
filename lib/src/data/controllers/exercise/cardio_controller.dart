import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fitandfitness/src/app/data_entry/application/cardio_exercise_provider.dart';
import 'package:fitandfitness/src/data/controllers/exercise/custom_cardio_controller.dart';
import 'package:fitandfitness/src/data/controllers/exercise/recent_cardio_controller.dart';
import 'package:fitandfitness/src/data/repositories/exercise/cardio_repository.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardioControllerProvider =
    AsyncNotifierProvider<CardioController, List<Cardio>>(CardioController.new);

class CardioController extends AsyncNotifier<List<Cardio>> {
  @override
  FutureOr<List<Cardio>> build() => getEntries();

  Future<List<Cardio>> getEntries() async {
    try {
      final cardioRepository = ref.read(cardioRepositoryProvider);
      final cardioEntries = await cardioRepository?.getEntries() ?? [];

      cardioEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return cardioEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> _updateEntry(Cardio cardio) async {
    final cardioRepository = ref.read(cardioRepositoryProvider);
    cardioRepository?.updateEntry(cardio);

    state.whenData(
      (cardioEntries) {
        final updatedCardioEntries = [
          for (final cardioEntry in cardioEntries)
            if (cardioEntry.id == cardio.id) cardio else cardioEntry
        ];
        updatedCardioEntries
            .sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
        state = AsyncValue.data(updatedCardioEntries);
      },
    );
  }

  Future<void> addOrUpdateEntry(Cardio cardio) async {
    final exercise = ref.watch(cardioExerciseProvider).firstWhereOrNull(
          (cardioExercise) =>
              cardio.exercise.name.toLowerCase() ==
              cardioExercise.name.toLowerCase(),
        );

    ref
        .read(recentCardioControllerProvider.notifier)
        .addOrUpdateEntry(cardio.exercise);

    if (exercise == null && !cardio.exercise.isPreset) {
      ref
          .read(customCardioControllerProvider.notifier)
          .addOrUpdateEntry(cardio.exercise);
    }

    if (cardio.id == null) {
      final cardioRepository = ref.read(cardioRepositoryProvider);
      final id = await cardioRepository?.addEntry(cardio);

      state.whenData(
        (cardioEntries) {
          cardioEntries.add(cardio.copyWith(id: id));
          cardioEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
          return state = AsyncValue.data(cardioEntries);
        },
      );
    } else {
      _updateEntry(cardio);
    }
  }

  Future<void> deleteEntry(String id) async {
    final cardioRepository = ref.read(cardioRepositoryProvider);
    await cardioRepository?.deleteEntry(id);
    state.whenData(
      (cardioEntries) {
        cardioEntries.removeWhere((cardio) => cardio.id == id);
        state = AsyncValue.data(cardioEntries);
      },
    );
  }
}
