import 'dart:io';
import 'package:check_in_app/presentation/widgets/cupertino/cupertino_time_picker.dart';
import 'package:flutter/material.dart';

import 'material/material_time_picker.dart';

class TimePickerService {
  static Future<TimeOfDay?> getTime(context) {
    return Platform.isIOS
        ? CupertinoTimePickerService.getTime(context)
        : MaterialTimePickerService.getTime(context);
  }
}
