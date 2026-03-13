import 'dart:async';

import 'package:fitandfitness/src/data/repositories/mood_repository.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/services/image_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final moodControllerProvider =
    AsyncNotifierProvider<MoodController, List<Mood>>(MoodController.new);

class MoodController extends AsyncNotifier<List<Mood>> {
  @override
  FutureOr<List<Mood>> build() => getEntries();

  Future<List<Mood>> getEntries() async {
    try {
      final moodRepository = ref.read(moodRepositoryProvider);

      final moodEntries = await moodRepository?.getEntries() ?? [];

      moodEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return moodEntries;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await getEntries());
  }

  Future<void> addOrUpdateEntry(
    Mood mood, {
    XFile? photo,
    bool deleteRecordedPhoto = false,
  }) async {
    if (mood.id != null) {
      return _updateEntry(
        mood,
        photo: photo,
        deleteRecordedPhoto: deleteRecordedPhoto,
      );
    }

    Mood tempMood = mood;

    if (photo != null) {
      final imageStorageService = ref.read(imageStorageServiceProvider);
      final photos =
          await imageStorageService.uploadPhoto(photo, ImageType.mood);

      tempMood = tempMood.copyWith(
        progressPhotos: [photos.original],
        progressPhotosMedium: [photos.medium],
        progressPhotosSmall: [photos.small],
      );
    }

    final moodRepository = ref.read(moodRepositoryProvider);
    final id = await moodRepository?.addEntry(tempMood);

    state.whenData(
      (moodEntries) {
        moodEntries.add(tempMood.copyWith(id: id));
        moodEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
        return state = AsyncValue.data(moodEntries);
      },
    );
  }

  Future<void> _updateEntry(
    Mood mood, {
    XFile? photo,
    bool deleteRecordedPhoto = false,
  }) async {
    Mood tempMood = mood;

    if (deleteRecordedPhoto) {
      deletePhotos(mood);
      tempMood = tempMood.copyWith(
        progressPhotos: null,
        progressPhotosMedium: null,
        progressPhotosSmall: null,
      );
    }
    final imageStorageService = ref.read(imageStorageServiceProvider);
    final moodRepository = ref.read(moodRepositoryProvider);

    if (photo != null) {
      final photos =
          await imageStorageService.uploadPhoto(photo, ImageType.mood);

      tempMood = tempMood.copyWith(
        progressPhotos: [photos.original],
        progressPhotosMedium: [photos.medium],
        progressPhotosSmall: [photos.small],
      );
    }

    moodRepository?.updateEntry(tempMood);

    state.whenData(
      (moodEntries) {
        final updatedMoodEntries = [
          for (final element in moodEntries)
            if (element.id == mood.id) tempMood else element
        ];
        updatedMoodEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

        state = AsyncValue.data(updatedMoodEntries);
      },
    );
  }

  Future<void> deleteEntry(Mood mood) async {
    final moodRepository = ref.read(moodRepositoryProvider);
    await moodRepository?.deleteEntry(mood.id ?? '');

    deletePhotos(mood);

    state.whenData(
      (moodEntries) {
        moodEntries.removeWhere((entry) => entry.id == mood.id);
        state = AsyncValue.data(moodEntries);
      },
    );
  }

  Future<void> deletePhotos(Mood mood) async {
    final imageStorageService = ref.read(imageStorageServiceProvider);

    mood.progressPhotos?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
    mood.progressPhotosMedium?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
    mood.progressPhotosSmall?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
  }
}
