import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/data/repositories/base_user_log_repository.dart';
import 'package:fitandfitness/src/models/exercise/cardio/cardio.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cardio_repository.g.dart';

@riverpod
CardioRepository? cardioRepository(CardioRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final collection =
      db.collection('user_logs').doc(user.uid).collection('cardio');

  return CardioRepository(
    userId: user.uid,
    collection: collection,
  );
}

class CardioRepository extends BaseUserLogRepository<Cardio> {
  CardioRepository({
    required this.userId,
    required this.collection,
  });

  final String userId;
  final CollectionReference collection;

  @override
  Future<String> addEntry(Cardio entry) async {
    final cardio = await collection.add(
      entry.toJson(),
    );
    return cardio.id;
  }

  @override
  Future<List<Cardio>> getEntries() async {
    QuerySnapshot querySnapshot = await collection.get();

    final allEntries = querySnapshot.docs.map(
      (doc) {
        final entry = Cardio.fromJson(doc.data() as Map<String, dynamic>);

        return entry.copyWith(id: doc.id);
      },
    ).toList();

    return allEntries;
  }

  @override
  Future<void> updateEntry(Cardio entry) async =>
      await collection.doc(entry.id).update(entry.toJson());

  @override
  Future<void> deleteEntry(String id) async =>
      await collection.doc(id).delete();
}
