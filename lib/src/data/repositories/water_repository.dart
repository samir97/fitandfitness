import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/data/repositories/base_user_log_repository.dart';
import 'package:fitandfitness/src/models/water/water.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final waterRepositoryProvider = Provider<WaterRepository?>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    if (user == null) return null;

    final db = ref.watch(fireStoreProvider);

    final collection =
        db.collection('user_logs').doc(user.uid).collection('water');

    return WaterRepository(
      userId: user.uid,
      collection: collection,
    );
  },
);

class WaterRepository extends BaseUserLogRepository<Water> {
  WaterRepository({
    required this.userId,
    required this.collection,
  });

  final String userId;
  final CollectionReference collection;

  @override
  Future<String> addEntry(Water entry) async {
    final water = await collection.add(entry.toJson());
    return water.id;
  }

  @override
  Future<List<Water>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs.map(
      (doc) {
        final entry = Water.fromJson(doc.data() as Map<String, dynamic>);

        return entry.copyWith(id: doc.id);
      },
    ).toList();

    return allEntries;
  }

  @override
  Future<void> updateEntry(Water entry) async =>
      await collection.doc(entry.id).update(entry.toJson());

  @override
  Future<void> deleteEntry(String id) async =>
      await collection.doc(id).delete();
}
