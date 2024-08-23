import 'package:flutter/material.dart';

extension NumEx on num {
  SizedBox get box => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );

  SizedBox get xBox => SizedBox(
        width: toDouble(),
      );

  SizedBox get yBox => SizedBox(
        height: toDouble(),
      );
}
