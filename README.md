# Fit&Fitness

A Flutter app for tracking workouts, mood, sleep, water intake, and weight, all synced to the cloud with Firebase.

**Demo:** [fitandfitness.app](https://fitandfitness.app/)

## Features

- Strength and cardio exercise tracking with custom exercises and muscle group filters
- Mood logging with sentiment levels and activity tags
- Sleep tracking with a circular range picker for bedtime/wake-up
- Water intake logging
- Weight tracking with trend charts
- Progress photos with cloud storage
- Detail pages with historical charts (powered by fl_chart)
- Firebase Authentication (Email, Google Sign-In, Apple Sign-In)
- Cloud Firestore for real-time sync across devices
- Unit preferences (metric/imperial) for weight, height, water, and energy
- iOS and Android

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) >= 3.2.4
- A [Firebase](https://firebase.google.com/) project
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)

## Setup

Credentials are gitignored, so you'll need your own Firebase project. Each config file has a `.example` in the repo you can reference.

### 1. Create a Firebase Project

1. Head to the [Firebase Console](https://console.firebase.google.com) and create a new project
2. Enable **Authentication** with these sign-in providers:
   - Email/Password
   - Google Sign-In
   - Apple Sign-In (for iOS)
3. Enable **Cloud Firestore**
4. Enable **Firebase Storage** (used for progress photos)
5. Register your apps:
   - **Android** with package name `app.fitandfitness.main`
   - **iOS** with bundle ID `app.fitandfitness.main`

### 2. Generate Firebase Config

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=YOUR_PROJECT_ID
```

This generates `lib/firebase_options.dart`. See `lib/firebase_options.dart.example` for the expected structure.

### 3. Download Platform Config Files

From Firebase Console, download the config files for each platform:

- **Android:** Download `google-services.json` and place it in `android/app/`
- **iOS:** Download `GoogleService-Info.plist` and place it in `ios/Runner/`
- **iOS:** Create `ios/firebase_app_id_file.json`. See `ios/firebase_app_id_file.json.example` for the format

### 4. Set Google OAuth Client ID

```bash
cp lib/src/firebase/firebase_config.dart.example lib/src/firebase/firebase_config.dart
```

Open `lib/src/firebase/firebase_config.dart` and replace `YOUR_GOOGLE_CLIENT_ID` with the **iOS client ID** from Firebase Console (Authentication > Sign-in method > Google).

### 5. Update iOS URL Scheme

In `ios/Runner/Info.plist`, replace `YOUR_REVERSED_CLIENT_ID` in the `CFBundleURLSchemes` section with the reversed client ID from your `GoogleService-Info.plist`.

### 6. Android Signing (release builds)

```bash
cp android/key.properties.example android/key.properties
```

Fill in your keystore path and passwords. To generate a new upload keystore:

```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Move the generated `upload-keystore.jks` to the `android/` directory.

## Running the App

```bash
flutter pub get
dart run build_runner build   # generates .g.dart and .freezed.dart files
flutter run
```

## Project Structure

```
lib/
  main.dart
  firebase_options.dart.example         # Template for generated Firebase config
  src/
    app/
      authentication/                   # Auth gate, sign-in flow
      dashboard/                        # Main screen: exercise, mood, sleep, water, weight widgets
      data_entry/                       # Entry screens for each tracked metric
      details_page/                     # History and trend charts per metric
      settings/                         # User profile, unit preferences, account management
    common_widgets/                     # Reusable UI (weight entry, water display, pickers, etc.)
    constants/                          # Theme definitions
    data/
      controllers/                      # Riverpod state controllers
      repositories/                     # Firestore repository layer
    firebase/
      firebase_config.dart.example      # Template for auth config
    models/                             # Freezed data classes (exercise, mood, sleep, water, weight)
    routing/                            # Route definitions
    services/                           # Image storage, unit conversion, versioning
android/
  app/
    google-services.json.example        # Template for Android Firebase config
  key.properties.example                # Template for signing config
ios/
  Runner/
    GoogleService-Info.plist.example     # Template for iOS Firebase config
  firebase_app_id_file.json.example     # Template for Firebase app ID
```

## Tech Stack

- **State management:** Riverpod (with code generation)
- **Data classes:** Freezed + json_serializable
- **Charts:** fl_chart
- **Backend:** Firebase (Auth, Firestore, Storage, Crashlytics, Remote Config, App Check)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT — see [LICENSE](LICENSE) for details.
