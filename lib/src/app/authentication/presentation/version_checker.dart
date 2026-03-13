import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionChecker {
  final FirebaseRemoteConfig remoteConfig;

  VersionChecker({required this.remoteConfig});

  Future<int> privacyPolicy() async {
    await remoteConfig.fetchAndActivate();

    return int.tryParse(remoteConfig.getString('current_terms_version')) ?? 1;
  }

  Future<(bool isBelowMinimum, String message)> app() async {
    await remoteConfig.fetchAndActivate();
    final minimumVersion = remoteConfig.getString('minimum_app_version');
    final message = remoteConfig.getString('minimum_app_version_message');
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final isBelowMinimum =
        _isAppVersionBelowMinimum(currentVersion, minimumVersion);

    return (isBelowMinimum, message);
  }

  bool _isAppVersionBelowMinimum(String currentVersion, String minimumVersion) {
    List<int> currentParts = currentVersion.split('.').map(int.parse).toList();
    List<int> minimumParts = minimumVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      if (currentParts[i] < minimumParts[i]) {
        return true;
      } else if (currentParts[i] > minimumParts[i]) {
        return false;
      }
    }
    return false;
  }
}
