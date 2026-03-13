import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio_exercise.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cardio_exercise_repository.g.dart';

@riverpod
CardioExerciseRepository? customCardioRepository(
    CustomCardioRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final collection = db
      .collection('exercises')
      .doc(user.uid)
      .collection('custom_cardio_exercises');

  return CardioExerciseRepository(
    collection: collection,
  );
}

@riverpod
CardioExerciseRepository? recentCardioRepository(
    RecentCardioRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final collection = db
      .collection('exercises')
      .doc(user.uid)
      .collection('recent_cardio_exercises');

  return CardioExerciseRepository(
    collection: collection,
  );
}

class CardioExerciseRepository {
  CardioExerciseRepository({
    required this.collection,
  });

  final CollectionReference collection;

  Future<List<CardioExercise>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs
        .map(
          (doc) => CardioExercise.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();

    return allEntries;
  }

  Future<void> addEntry(CardioExercise customCardioExercise) async {
    final base64UrlName = base64Url.encode(customCardioExercise.name.codeUnits);
    await collection.doc(base64UrlName).set(customCardioExercise.toJson());
  }

  Future<void> deleteEntry(String name) async {
    final base64UrlName = base64Url.encode(name.codeUnits);
    await collection.doc(base64UrlName).delete();
  }
}
