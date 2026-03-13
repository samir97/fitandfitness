import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/data/repositories/base_user_log_repository.dart';
import 'package:fitandfitness/src/models/weight/weight.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weightRepositoryProvider = Provider<WeightRepository?>(
  (ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    if (user == null) return null;

    final db = ref.watch(fireStoreProvider);

    final collection =
        db.collection('user_logs').doc(user.uid).collection('weight');

    return WeightRepository(
      userId: user.uid,
      collection: collection,
    );
  },
);

class WeightRepository extends BaseUserLogRepository<Weight> {
  WeightRepository({
    required this.userId,
    required this.collection,
  });

  final String userId;
  final CollectionReference collection;

  @override
  Future<String> addEntry(Weight entry) async {
    final weight = await collection.add(entry.toJson());
    return weight.id;
  }

  @override
  Future<List<Weight>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs.map(
      (doc) {
        final entry = Weight.fromJson(doc.data() as Map<String, dynamic>);

        return entry.copyWith(id: doc.id);
      },
    ).toList();

    return allEntries;
  }

  @override
  Future<void> updateEntry(Weight entry) async =>
      await collection.doc(entry.id).update(entry.toJson());

  @override
  Future<void> deleteEntry(String id) async =>
      await collection.doc(id).delete();
}
