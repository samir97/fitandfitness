import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/models/user/preferences/dark_mode/dark_mode_preference.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details_and_prefs_repository.g.dart';

@riverpod
UserDetailsAndPrefsRepository? userDetailsAndPrefsRepository(
    UserDetailsAndPrefsRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return null;

  final db = ref.watch(fireStoreProvider);

  final documentReference =
      db.collection(UserDetailsAndPrefsStorageKeys.users).doc(user.uid);

  return UserDetailsAndPrefsRepository(documentReference: documentReference);
}

class UserDetailsAndPrefsRepository {
  final DocumentReference documentReference;

  UserDetailsAndPrefsRepository({
    required this.documentReference,
  });

  Future<UserDetailsAndPrefs?> getUserDetailsAndPrefs() async {
    final doc = await documentReference.get();

    if (!doc.exists) return null;

    final data = doc.data() as Map<String, dynamic>;
    return UserDetailsAndPrefs.fromJson(data);
  }

  Future<void> create({
    required UserDetailsAndPrefs userDetailsAndPrefs,
  }) async =>
      await documentReference.set(
        {
          UserDetailsAndPrefsStorageKeys.userDetails:
              userDetailsAndPrefs.userDetails.toJson(),
          UserDetailsAndPrefsStorageKeys.unitPreferences:
              userDetailsAndPrefs.unitPreferences.toJson(),
          UserDetailsAndPrefsStorageKeys.darkModePreference:
              userDetailsAndPrefs.darkModePreference.toJson(),
          UserDetailsAndPrefsStorageKeys.acceptedTermsVersion:
              userDetailsAndPrefs.acceptedTermsVersion,
        },
      );

  Future<void> editUserDetails(
    UserDetails userDetails,
  ) async =>
      await documentReference.update(
        {
          UserDetailsAndPrefsStorageKeys.userDetails: userDetails.toJson(),
        },
      );

  Future<void> editUnitPreferences(
    UnitPreferences unitPreferences,
  ) async =>
      await documentReference.update(
        {
          UserDetailsAndPrefsStorageKeys.unitPreferences:
              unitPreferences.toJson(),
        },
      );

  Future<void> editDarkModePreference(
    DarkModePreference darkModePreference,
  ) async =>
      await documentReference.update(
        {
          UserDetailsAndPrefsStorageKeys.darkModePreference:
              darkModePreference.toJson(),
        },
      );

  Future<void> editAcceptedTermsVersion(int version) async =>
      await documentReference.update(
        {
          UserDetailsAndPrefsStorageKeys.acceptedTermsVersion: version,
        },
      );

  Future<void> delete() async => await documentReference.delete();
}
