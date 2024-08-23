// time_of_day_extensions.dart
import 'package:flutter/material.dart';

extension ReadableTimeOfDay on TimeOfDay {
  String toReadableString() {
    final hours = this.hour % 12 == 0 ? 12 : this.hour % 12;
    final period = this.hour >= 12 ? 'PM' : 'AM';
    final minutes = this.minute.toString().padLeft(2, '0');
    return '$hours:$minutes $period';
  }
}
