import 'dart:io';

import 'package:fitandfitness/src/common_widgets/shimmer_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPanel extends StatelessWidget {
  final VoidCallback onDismissed;
  final bool isPhotoDeleted;
  final String? recordedPhotoUrl;
  final XFile? localPhoto;

  const PhotoPanel({
    super.key,
    required this.onDismissed,
    required this.isPhotoDeleted,
    this.recordedPhotoUrl,
    this.localPhoto,
  }) : assert(localPhoto != null || recordedPhotoUrl != null);

  @override
  Widget build(BuildContext context) {
    if (recordedPhotoUrl == null && isPhotoDeleted && localPhoto == null) {
      return const SizedBox();
    }

    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(onDismissed: onDismissed),
        children: [
          SlidableAction(
            onPressed: (context) => onDismissed(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_outlined,
            label: 'Delete',
          ),
        ],
      ),
      child: (recordedPhotoUrl != null && !isPhotoDeleted)
          ? ShimmerCachedNetworkImage(imageUrl: recordedPhotoUrl!)
          : Image.file(File(localPhoto!.path)),
    );
  }
}
