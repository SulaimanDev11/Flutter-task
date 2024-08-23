import 'dart:io';
import 'package:check_in_app/presentation/widgets/cupertino/cupertino_date_picker.dart';
import 'material/material_date_picker.dart';

class DatePickerService {
  static Future<DateTime?> getDate(context) {
    return Platform.isIOS
        ? CupertinoDatePickerService.getDate(context)
        : MaterialDatePickerService.getDate(context);
  }
}
