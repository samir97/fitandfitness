// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_entry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moodEntryHash() => r'8e595cf7b9896307919f58d5824843a86a0449b3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MoodEntry extends BuildlessAutoDisposeNotifier<Mood> {
  late final Mood? mood;

  Mood build({
    Mood? mood,
  });
}

/// See also [MoodEntry].
@ProviderFor(MoodEntry)
const moodEntryProvider = MoodEntryFamily();

/// See also [MoodEntry].
class MoodEntryFamily extends Family<Mood> {
  /// See also [MoodEntry].
  const MoodEntryFamily();

  /// See also [MoodEntry].
  MoodEntryProvider call({
    Mood? mood,
  }) {
    return MoodEntryProvider(
      mood: mood,
    );
  }

  @override
  MoodEntryProvider getProviderOverride(
    covariant MoodEntryProvider provider,
  ) {
    return call(
      mood: provider.mood,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'moodEntryProvider';
}

/// See also [MoodEntry].
class MoodEntryProvider
    extends AutoDisposeNotifierProviderImpl<MoodEntry, Mood> {
  /// See also [MoodEntry].
  MoodEntryProvider({
    Mood? mood,
  }) : this._internal(
          () => MoodEntry()..mood = mood,
          from: moodEntryProvider,
          name: r'moodEntryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moodEntryHash,
          dependencies: MoodEntryFamily._dependencies,
          allTransitiveDependencies: MoodEntryFamily._allTransitiveDependencies,
          mood: mood,
        );

  MoodEntryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mood,
  }) : super.internal();

  final Mood? mood;

  @override
  Mood runNotifierBuild(
    covariant MoodEntry notifier,
  ) {
    return notifier.build(
      mood: mood,
    );
  }

  @override
  Override overrideWith(MoodEntry Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoodEntryProvider._internal(
        () => create()..mood = mood,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mood: mood,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MoodEntry, Mood> createElement() {
    return _MoodEntryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoodEntryProvider && other.mood == mood;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mood.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MoodEntryRef on AutoDisposeNotifierProviderRef<Mood> {
  /// The parameter `mood` of this provider.
  Mood? get mood;
}

class _MoodEntryProviderElement
    extends AutoDisposeNotifierProviderElement<MoodEntry, Mood>
    with MoodEntryRef {
  _MoodEntryProviderElement(super.provider);

  @override
  Mood? get mood => (origin as MoodEntryProvider).mood;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
