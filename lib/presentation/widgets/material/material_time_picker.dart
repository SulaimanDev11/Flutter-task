import 'package:flutter/material.dart';

class MaterialTimePickerService {
  TimeOfDay? selectedTime;
  static Future<TimeOfDay?> getTime(context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      return picked;
    }
    return null;
  }
}
