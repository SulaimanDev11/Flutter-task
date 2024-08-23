import 'dart:io';
import 'package:flutter/material.dart';
import 'cupertino/cupertino_action_button.dart';
import 'material/material_action_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionButton(title: title, onTap: onTap)
        : MaterialActionButton(title: title, onTap: onTap);
  }
}
