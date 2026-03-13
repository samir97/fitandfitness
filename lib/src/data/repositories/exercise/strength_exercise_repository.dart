import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/models/exercise/strength/strength_exercise.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'strength_exercise_repository.g.dart';

@riverpod
StrengthExerciseRepository? customStrengthRepository(
    CustomStrengthRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final collection = db
      .collection('exercises')
      .doc(user.uid)
      .collection('custom_strength_exercises');

  return StrengthExerciseRepository(
    collection: collection,
  );
}

@riverpod
StrengthExerciseRepository? recentStrengthRepository(
    RecentStrengthRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final collection = db
      .collection('exercises')
      .doc(user.uid)
      .collection('recent_strength_exercises');

  return StrengthExerciseRepository(
    collection: collection,
  );
}

class StrengthExerciseRepository {
  StrengthExerciseRepository({
    required this.collection,
  });

  final CollectionReference collection;

  Future<List<StrengthExercise>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs
        .map(
          (doc) =>
              StrengthExercise.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();

    return allEntries;
  }

  Future<void> addEntry(StrengthExercise customStrengthExercise) async {
    final base64UrlName =
        base64Url.encode(customStrengthExercise.name.codeUnits);
    await collection.doc(base64UrlName).set(customStrengthExercise.toJson());
  }

  Future<void> deleteEntry(String name) async {
    final base64UrlName = base64Url.encode(name.codeUnits);
    await collection.doc(base64UrlName).delete();
  }
}
