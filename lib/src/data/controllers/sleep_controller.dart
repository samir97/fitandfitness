import 'dart:async';

import 'package:fitandfitness/src/data/repositories/sleep_repository.dart';
import 'package:fitandfitness/src/models/sleep/sleep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sleepControllerProvider =
    AsyncNotifierProvider<SleepController, List<Sleep>>(SleepController.new);

class SleepController extends AsyncNotifier<List<Sleep>> {
  @override
  FutureOr<List<Sleep>> build() => getEntries();

  Future<List<Sleep>> getEntries() async {
    try {
      final sleepRepository = ref.read(sleepRepositoryProvider);
      final sleepEntries = await sleepRepository?.getEntries() ?? [];

      sleepEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return sleepEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await getEntries());
  }

  Future<void> _updateEntry(Sleep sleep) async {
    final sleepRepository = ref.read(sleepRepositoryProvider);
    sleepRepository?.updateEntry(sleep);

    state.whenData(
      (sleepEntries) {
        final updatedSleepEntries = [
          for (final element in sleepEntries)
            if (element.id == sleep.id) sleep else element
        ];

        updatedSleepEntries
            .sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

        return state = AsyncValue.data(updatedSleepEntries);
      },
    );
  }

  Future<void> addOrUpdateEntry(Sleep sleep) async {
    if (sleep.id == null) {
      final waterRepository = ref.read(sleepRepositoryProvider);
      final id = await waterRepository?.addEntry(sleep);

      state.whenData(
        (sleepEntries) {
          sleepEntries.add(sleep.copyWith(id: id));
          sleepEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
          return state = AsyncValue.data(sleepEntries);
        },
      );
    } else {
      _updateEntry(sleep);
    }
  }

  Future<void> deleteEntry(String id) async {
    final sleepRepository = ref.read(sleepRepositoryProvider);
    await sleepRepository?.deleteEntry(id);
    state.whenData(
      (sleepEntries) {
        sleepEntries.removeWhere((sleep) => sleep.id == id);
        state = AsyncValue.data(sleepEntries);
      },
    );
  }
}
