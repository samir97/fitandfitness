import 'dart:async';

import 'package:fitandfitness/src/data/repositories/water_repository.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final waterControllerProvider =
    AsyncNotifierProvider<WaterController, List<Water>>(WaterController.new);

class WaterController extends AsyncNotifier<List<Water>> {
  @override
  FutureOr<List<Water>> build() => getEntries();

  Future<List<Water>> getEntries() async {
    try {
      final waterRepository = ref.read(waterRepositoryProvider);
      final waterEntries = await waterRepository?.getEntries() ?? [];

      waterEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return waterEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await getEntries());
  }

  Future<void> _updateEntry(Water water) async {
    ref.read(waterRepositoryProvider)?.updateEntry(water);

    state.whenData(
      (waterEntries) {
        final updatedWaterEntries = [
          for (final waterEntry in waterEntries)
            if (waterEntry.id == water.id) water else waterEntry
        ];
        updatedWaterEntries
            .sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
        state = AsyncValue.data(updatedWaterEntries);
      },
    );
  }

  Future<void> addOrUpdateEntry(Water water) async {
    if (water.id == null) {
      final waterRepository = ref.read(waterRepositoryProvider);
      final id = await waterRepository?.addEntry(water);

      state.whenData(
        (waterEntries) {
          waterEntries.add(water.copyWith(id: id));
          waterEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
          return state = AsyncValue.data(waterEntries);
        },
      );
    } else {
      _updateEntry(water);
    }
  }

  Future<void> deleteEntry(String id) async {
    final waterRepository = ref.read(waterRepositoryProvider);
    await waterRepository?.deleteEntry(id);
    state.whenData(
      (waterEntries) {
        waterEntries.removeWhere((water) => water.id == id);
        state = AsyncValue.data(waterEntries);
      },
    );
  }
}
