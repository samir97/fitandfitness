import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/data/repositories/base_user_log_repository.dart';
import 'package:fitandfitness/src/models/sleep/sleep.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sleepRepositoryProvider = Provider<SleepRepository?>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    if (user == null) return null;

    final db = ref.watch(fireStoreProvider);

    final collection =
        db.collection('user_logs').doc(user.uid).collection('sleep');

    return SleepRepository(
      userId: user.uid,
      collection: collection,
    );
  },
);

class SleepRepository extends BaseUserLogRepository<Sleep> {
  SleepRepository({
    required this.userId,
    required this.collection,
  });

  final String userId;
  final CollectionReference collection;

  @override
  Future<String> addEntry(Sleep entry) async {
    final sleep = await collection.add(entry.toJson());
    return sleep.id;
  }

  @override
  Future<List<Sleep>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs.map(
      (doc) {
        final entry = Sleep.fromJson(doc.data() as Map<String, dynamic>);

        return entry.copyWith(id: doc.id);
      },
    ).toList();

    return allEntries;
  }

  @override
  Future<void> updateEntry(Sleep entry) async =>
      await collection.doc(entry.id).update(entry.toJson());

  @override
  Future<void> deleteEntry(String id) async =>
      await collection.doc(id).delete();
}
