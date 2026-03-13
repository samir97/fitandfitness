import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/data/repositories/base_user_log_repository.dart';
import 'package:fitandfitness/src/models/mood/mood.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodRepositoryProvider = Provider<MoodRepository?>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    if (user == null) return null;

    final db = ref.watch(fireStoreProvider);

    final collection =
        db.collection('user_logs').doc(user.uid).collection('mood');

    return MoodRepository(
      userId: user.uid,
      collection: collection,
    );
  },
);

class MoodRepository extends BaseUserLogRepository<Mood> {
  MoodRepository({
    required this.userId,
    required this.collection,
  });

  final String userId;
  final CollectionReference collection;

  @override
  Future<String> addEntry(Mood entry) async {
    final mood = await collection.add(entry.toJson());
    return mood.id;
  }

  @override
  Future<List<Mood>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs.map(
      (doc) {
        final entry = Mood.fromJson(doc.data() as Map<String, dynamic>);
        return entry.copyWith(id: doc.id);
      },
    ).toList();

    return allEntries;
  }

  @override
  Future<void> updateEntry(Mood entry) async =>
      await collection.doc(entry.id).update(entry.toJson());

  @override
  Future<void> deleteEntry(String id) async =>
      await collection.doc(id).delete();
}
