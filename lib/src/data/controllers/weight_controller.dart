import 'dart:async';

import 'package:fitandfitness/src/app/data_entry/presentation/entry_alert_dialog.dart';
import 'package:fitandfitness/src/data/repositories/weight_repository.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:fitandfitness/src/services/image_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weightControllerProvider =
    AsyncNotifierProvider<WeightController, List<Weight>>(WeightController.new);

class WeightController extends AsyncNotifier<List<Weight>> {
  @override
  FutureOr<List<Weight>> build() => getEntries();

  Future<List<Weight>> getEntries() async {
    try {
      final weightRepository = ref.read(weightRepositoryProvider);
      final weightEntries = await weightRepository?.getEntries() ?? [];
      weightEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      return weightEntries;
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
    Weight weight, {
    XFile? photo,
    bool deleteRecordedPhoto = false,
  }) async {
    if (weight.id != null) {
      return _updateEntry(weight,
          photo: photo, deleteRecordedPhoto: deleteRecordedPhoto);
    }

    Weight tempWeight = weight;

    if (photo != null) {
      final imageStorageService = ref.read(imageStorageServiceProvider);
      final photos =
          await imageStorageService.uploadPhoto(photo, ImageType.weight);

      tempWeight = tempWeight.copyWith(
        progressPhotos: [photos.original],
        progressPhotosMedium: [photos.medium],
        progressPhotosSmall: [photos.small],
      );
    }

    final weightRepository = ref.read(weightRepositoryProvider);
    final id = await weightRepository?.addEntry(tempWeight);

    state.whenData(
      (weightEntries) {
        weightEntries.add(tempWeight.copyWith(id: id));
        weightEntries.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
        return state = AsyncValue.data(weightEntries);
      },
    );
  }

  Future<void> _updateEntry(Weight weight,
      {XFile? photo, bool deleteRecordedPhoto = false}) async {
    Weight tempWeight = weight;

    if (deleteRecordedPhoto) {
      deletePhotos(weight);
      tempWeight = tempWeight.copyWith(
        progressPhotos: null,
        progressPhotosMedium: null,
        progressPhotosSmall: null,
      );
    }

    final imageStorageService = ref.read(imageStorageServiceProvider);
    final weightRepository = ref.read(weightRepositoryProvider);

    if (photo != null) {
      final photos =
          await imageStorageService.uploadPhoto(photo, ImageType.weight);

      tempWeight = tempWeight.copyWith(
        progressPhotos: [photos.original],
        progressPhotosMedium: [photos.medium],
        progressPhotosSmall: [photos.small],
      );
    }

    weightRepository?.updateEntry(tempWeight);

    state.whenData(
      (weightEntries) {
        final updatedWeightEntries = [
          for (final element in weightEntries)
            if (element.id == weight.id) tempWeight else element
        ];

        updatedWeightEntries
            .sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

        state = AsyncValue.data(updatedWeightEntries);
      },
    );
  }

  Future<void> deleteEntry(
    BuildContext context,
    Weight weight,
  ) async {
    final weightRepository = ref.read(weightRepositoryProvider);
    state.whenData(
      (weightEntries) async {
        if (weightEntries.length == 1) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const EntryAlertDialog(
              title: 'Deletion Failed',
              body:
                  "You must have at least one weight entry, please add another entry before deleting this one.",
            ),
          );
          return;
        }

        await weightRepository?.deleteEntry(weight.id ?? "");

        deletePhotos(weight);
        weightEntries.removeWhere((entry) => entry.id == weight.id);
        state = AsyncValue.data(weightEntries);
      },
    );
  }

  Future<void> deletePhotos(Weight weight) async {
    final imageStorageService = ref.read(imageStorageServiceProvider);

    weight.progressPhotos?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
    weight.progressPhotosMedium?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
    weight.progressPhotosSmall?.forEach(
        (photo) async => await imageStorageService.deletePhoto(photo.url));
  }
}
