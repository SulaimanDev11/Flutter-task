import 'package:flutter/material.dart';

void loading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
      content: SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );
}
