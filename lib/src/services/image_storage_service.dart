import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/models/progress_photo.dart';
import 'package:fitandfitness/src/top_level_providers.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

final imageStorageServiceProvider =
    Provider<ImageStorageService>((ref) => ImageStorageService(ref));

class ImageStorageService {
  Ref ref;

  ImageStorageService(this.ref);

  Future<({ProgressPhoto original, ProgressPhoto medium, ProgressPhoto small})>
      uploadPhoto(XFile photo, ImageType imageType) async {
    String userId = ref.read(authRepositoryProvider).currentUser!.uid;
    String photoId = const Uuid().v4();
    String extension = p.extension(photo.path);

    final originalUrl = await _compressAndUploadPhoto(
        userId, photo, imageType, ImageSize.original, photoId, extension);
    final mediumUrl = await _compressAndUploadPhoto(
        userId, photo, imageType, ImageSize.medium, photoId, extension);
    final smallUrl = await _compressAndUploadPhoto(
        userId, photo, imageType, ImageSize.small, photoId, extension);

    File(photo.path).delete();

    final recodedAt = DateTime.now();

    final original = ProgressPhoto(
      name: photoId,
      url: originalUrl ?? '',
      recordedAt: recodedAt,
    );

    final medium = ProgressPhoto(
      name: photoId,
      url: mediumUrl ?? '',
      recordedAt: recodedAt,
    );

    final small = ProgressPhoto(
      name: photoId,
      url: smallUrl ?? '',
      recordedAt: recodedAt,
    );

    return (original: original, medium: medium, small: small);
  }

  Future<void> deletePhoto(String url) async =>
      await ref.read(firebaseStorageProvider).refFromURL(url).delete();

  Future<String?> _compressAndUploadPhoto(
    String userId,
    XFile photo,
    ImageType imageType,
    ImageSize imageSize,
    String photoId,
    String extension,
  ) async {
    String cloudStoragePath =
        'images/$userId/${imageType.name}/${imageSize.name}/$photoId$extension';

    XFile? compressedImage = await _compressPhoto(
      photo,
      minWidth: imageSize.width,
      minHeight: imageSize.height,
    );

    if (compressedImage == null) return null;

    File compressedImageFile = File(compressedImage.path);

    TaskSnapshot snapshot = await ref
        .read(firebaseStorageProvider)
        .ref(cloudStoragePath)
        .putFile(compressedImageFile);

    compressedImageFile.delete();

    return snapshot.ref.getDownloadURL();
  }

  Future<XFile?> _compressPhoto(
    XFile photo, {
    int minWidth = 1920,
    int minHeight = 1080,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final extension = p.extension(photo.path);

    return await FlutterImageCompress.compressAndGetFile(
      photo.path,
      '$path/${DateTime.now().millisecondsSinceEpoch}$extension',
      quality: 80,
      minWidth: minWidth,
      minHeight: minHeight,
    );
  }
}

enum ImageType {
  mood,
  weight,
}

enum ImageSize {
  original,
  medium,
  small;

  int get width => switch (this) {
        ImageSize.original => 1920,
        ImageSize.medium => 300,
        ImageSize.small => 150
      };

  int get height => switch (this) {
        ImageSize.original => 1080,
        ImageSize.medium => 300,
        ImageSize.small => 150
      };
}
