// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_level_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fireStoreHash() => r'447c511f167935c4d267615f7a84fa49771d8d9e';

/// See also [fireStore].
@ProviderFor(fireStore)
final fireStoreProvider = Provider<FirebaseFirestore>.internal(
  fireStore,
  name: r'fireStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fireStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FireStoreRef = ProviderRef<FirebaseFirestore>;
String _$firebaseStorageHash() => r'9b239ccbfd0ef129cc8465924f751c6af8cb3563';

/// See also [firebaseStorage].
@ProviderFor(firebaseStorage)
final firebaseStorageProvider = Provider<FirebaseStorage>.internal(
  firebaseStorage,
  name: r'firebaseStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseStorageRef = ProviderRef<FirebaseStorage>;
String _$firebaseRemoteConfigHash() =>
    r'cf399a011f1a34fa2a85fe169d56803c7b5e5d7b';

/// See also [firebaseRemoteConfig].
@ProviderFor(firebaseRemoteConfig)
final firebaseRemoteConfigProvider =
    FutureProvider<FirebaseRemoteConfig>.internal(
  firebaseRemoteConfig,
  name: r'firebaseRemoteConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseRemoteConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseRemoteConfigRef = FutureProviderRef<FirebaseRemoteConfig>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
