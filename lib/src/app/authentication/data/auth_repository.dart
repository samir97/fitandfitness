import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> signOut() {
    return _auth.signOut();
  }
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository(
      ref.watch(firebaseAuthProvider),
    );

final authStateChangesProvider = StreamProvider<User?>(
  (ref) {
    return ref.watch(authRepositoryProvider).authStateChanges();
  },
);
