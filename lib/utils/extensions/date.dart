// date_time_extensions.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ReadableDateTime on DateTime {
  String toReadableDateString() {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(this);
  }

  String toReadableString() {
    final DateFormat formatter = DateFormat('MMM d, yyyy hh:mm a');
    return formatter.format(this);
  }

  DateTime combineWithTimeOfDay(TimeOfDay timeOfDay) {
    // Create a DateTime object with the date and time components
    return DateTime(
      this.year,
      this.month,
      this.day,
      timeOfDay.hour,
      timeOfDay.minute,
      0, // Seconds
      0, // Milliseconds
      0, // Microseconds
    );
  }

  String toIso8601WithMillis() {
    final dateTimeUtc = this.toUtc(); // Ensure the DateTime is in UTC
    return '${dateTimeUtc.toIso8601String().replaceAll('Z', '')}.${dateTimeUtc.millisecond.toString().padLeft(3, '0')}Z';
  }
}
