import 'dart:io';

import 'package:fitandfitness/src/app/data_entry/presentation/photo_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoListTile extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final Function(XFile?) onPhotoPicked;
  final Function onPhotoDelete;
  final String? recordedImage;

  const PhotoListTile({
    super.key,
    required this.title,
    this.onTap,
    required this.onPhotoPicked,
    required this.onPhotoDelete,
    this.recordedImage,
  });

  @override
  State<PhotoListTile> createState() => _PhotoListTileState();
}

class _PhotoListTileState extends State<PhotoListTile> {
  late final ImagePicker _picker = ImagePicker();
  XFile? _photo;
  bool _recordedImageDeleted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(widget.title),
          trailing: const Icon(Icons.camera_alt_rounded),
          onTap: () => onListTileTapped(context),
        ),
        if (_photo != null ||
            (widget.recordedImage != null && !_recordedImageDeleted))
          GestureDetector(
            onTap: () => onListTileTapped(context),
            child: PhotoPanel(
              onDismissed: _deletePhoto,
              localPhoto: _photo,
              recordedPhotoUrl: widget.recordedImage,
              isPhotoDeleted: _recordedImageDeleted,
            ),
          )
      ],
    );
  }

  void onListTileTapped(BuildContext context) {
    widget.onTap?.call();
    showActionSheet(
      context: context,
      onPhotoPick: _onPhotoPicked,
    );
  }

  _onPhotoPicked(photo) {
    _deletePhoto();
    widget.onPhotoPicked(photo);
    setState(() => _photo = photo);
  }

  void showActionSheet({
    required BuildContext context,
    required Function(XFile?) onPhotoPick,
  }) {
    if (Platform.isIOS) {
      showCupertinoActionSheet(context: context, onPhotoPick: onPhotoPick);
    } else {
      showAndroidActionSheet(context: context, onPhotoPick: onPhotoPick);
    }
  }

  void _deletePhoto() {
    if (_photo != null) {
      File(_photo!.path).delete();
      _photo = null;
    }
    setState(() {
      _recordedImageDeleted = true;
      widget.onPhotoDelete();
    });
  }

  Future<XFile?> _pickImage(ImageSource source) async =>
      await _picker.pickImage(source: source);

  showAndroidActionSheet({
    required BuildContext context,
    required Function(XFile?) onPhotoPick,
  }) =>
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  title: const Text('Camera'),
                  onTap: () =>
                      _selectPhoto(context, onPhotoPick, ImageSource.camera),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library_outlined,
                  ),
                  title: const Text('Photo Library'),
                  onTap: () =>
                      _selectPhoto(context, onPhotoPick, ImageSource.gallery),
                ),
                if (_photo != null ||
                    (widget.recordedImage != null && !_recordedImageDeleted))
                  ListTile(
                    leading: const Icon(
                      Icons.delete_outline,
                    ),
                    title: const Text('Delete Photo'),
                    onTap: () {
                      Navigator.of(context).pop();
                      _deletePhoto();
                    },
                  ),
              ],
            );
          });

  showCupertinoActionSheet({
    required BuildContext context,
    required Function(XFile?) onPhotoPick,
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('Add progress photo'),
              actions: [
                CupertinoActionSheetAction(
                  child: const Text('Camera'),
                  onPressed: () =>
                      _selectPhoto(context, onPhotoPick, ImageSource.camera),
                ),
                CupertinoActionSheetAction(
                  child: const Text('Photo Library'),
                  onPressed: () =>
                      _selectPhoto(context, onPhotoPick, ImageSource.gallery),
                ),
                if (_photo != null ||
                    (widget.recordedImage != null && !_recordedImageDeleted))
                  CupertinoActionSheetAction(
                    child: const Text(
                      'Delete Photo',
                      style: TextStyle(color: CupertinoColors.destructiveRed),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _deletePhoto();
                    },
                  ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )));

  void _selectPhoto(BuildContext context, Function(XFile?) onPhotoPick,
      ImageSource source) async {
    Navigator.of(context).pop();
    final pickedPhoto = await _pickImage(source);
    if (pickedPhoto != null) onPhotoPick(pickedPhoto);
  }
}
