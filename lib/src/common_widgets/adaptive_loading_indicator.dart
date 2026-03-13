import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AdaptiveLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? CupertinoActivityIndicator(color: color)
      : CircularProgressIndicator(color: color);
}
