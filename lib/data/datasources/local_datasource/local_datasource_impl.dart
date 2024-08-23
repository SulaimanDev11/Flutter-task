import 'package:check_in_app/data/params/params.dart';
import 'package:flutter/material.dart';

import 'local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<DateTimeParams?> getDate({required ContextParams c}) async {
    final dateTime = await showDatePicker(
      context: c.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (dateTime != null) {
      return DateTimeParams(dateTime: dateTime);
    }
    return null;
  }

  @override
  Future<TimeParams?> getTime({required ContextParams c}) async {
    final picked = await showTimePicker(
      context: c.context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      return TimeParams(time: picked);
    }
    return null;
  }
}
