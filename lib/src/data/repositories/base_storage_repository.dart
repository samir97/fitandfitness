import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(User user, XFile image);

  Future<String> getDownloadURL(User user, String imageName);
}
