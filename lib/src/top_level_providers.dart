import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_level_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore fireStore(FireStoreRef ref) {
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) =>
    FirebaseStorage.instance;

@Riverpod(keepAlive: true)
Future<FirebaseRemoteConfig> firebaseRemoteConfig(
    FirebaseRemoteConfigRef ref) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  try {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults(
      const {
        'minimum_app_version': '1.0.0',
        'minimum_app_version_message':
            'Please update and restart the app to continue.',
        'current_terms_version': '1',
      },
    );
    await remoteConfig.fetchAndActivate();
  } catch (e) {
    // ignore: avoid_print
  }

  return remoteConfig;
}
