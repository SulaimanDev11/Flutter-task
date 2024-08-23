import 'package:flutter/material.dart';

class MaterialDatePickerService {
  static Future<DateTime?> getDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      return picked;
    }
    return null;
  }
}
