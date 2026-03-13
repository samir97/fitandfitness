import 'package:fitandfitness/src/data/repositories/user_details_and_prefs_repository.dart';
import 'package:fitandfitness/src/models/user/preferences/dark_mode/dark_mode_preference.dart';
import 'package:fitandfitness/src/models/user/preferences/unit/unit_preferences.dart';
import 'package:fitandfitness/src/models/user/user_details/user_details.dart';
import 'package:fitandfitness/src/models/user/user_details_and_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details_and_prefs_controller.g.dart';

@Riverpod(keepAlive: true)
class UserDetailsAndPrefsController extends _$UserDetailsAndPrefsController {
  @override
  Future<UserDetailsAndPrefs?> build() async {
    final userDetailsAndPreferencesRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);

    if (userDetailsAndPreferencesRepository == null) return null;

    return await userDetailsAndPreferencesRepository.getUserDetailsAndPrefs();
  }

  Future<void> create(UserDetailsAndPrefs userDetailsAndPrefs) async {
    final userDetailsAndPrefsRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);

    if (userDetailsAndPrefsRepository == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        userDetailsAndPrefsRepository.create(
          userDetailsAndPrefs: userDetailsAndPrefs,
        );
        return userDetailsAndPrefs;
      },
    );
  }

  Future<void> editUserDetails(UserDetails userDetails) async {
    final userDetailsAndPreferencesRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);
    if (userDetailsAndPreferencesRepository == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        userDetailsAndPreferencesRepository.editUserDetails(
          userDetails,
        );
        return state.value?.copyWith(userDetails: userDetails);
      },
    );
  }

  Future<void> editUnitPreferences(UnitPreferences unitPreferences,
      {isOnboarding = false}) async {
    final userDetailsAndPreferencesRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);
    if (userDetailsAndPreferencesRepository == null) return;

    state = const AsyncLoading();

    if (isOnboarding) {
      state = AsyncData(
        UserDetailsAndPrefs(
          isOnboarding: true,
          userDetails: UserDetails(
              firstName: 'Hello',
              birthdate: DateTime.now(),
              sex: UserSex.other,
              height: 0,
              recordedAt: DateTime.now(),
              modifiedAt: DateTime.now()),
          unitPreferences: unitPreferences,
          acceptedTermsVersion: 1,
        ),
      );
      return;
    }

    state = await AsyncValue.guard(
      () async {
        await userDetailsAndPreferencesRepository.editUnitPreferences(
          unitPreferences,
        );

        return state.value?.copyWith(unitPreferences: unitPreferences);
      },
    );
  }

  Future<void> editDarkModePreference(
      DarkModePreference darkModePreference) async {
    final userDetailsAndPreferencesRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);

    if (userDetailsAndPreferencesRepository == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await userDetailsAndPreferencesRepository.editDarkModePreference(
          darkModePreference,
        );
        return state.value?.copyWith(darkModePreference: darkModePreference);
      },
    );
  }

  Future<void> editAcceptedTermsVersion(int acceptedTermsVersion) async {
    final userDetailsAndPreferencesRepository =
        ref.read(userDetailsAndPrefsRepositoryProvider);

    if (userDetailsAndPreferencesRepository == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await userDetailsAndPreferencesRepository.editAcceptedTermsVersion(
          acceptedTermsVersion,
        );
        return state.value
            ?.copyWith(acceptedTermsVersion: acceptedTermsVersion);
      },
    );
  }
}
