import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'cupertino/cupertino_widget.dart';
import 'material/material_widget.dart';

class AppScreenWidget extends StatelessWidget {
  const AppScreenWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoWidget(widget: widget)
        : MaterialWidget(widget: widget);
  }
}
