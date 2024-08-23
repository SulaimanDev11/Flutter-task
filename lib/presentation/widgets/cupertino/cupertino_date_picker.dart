// cupertino_date_picker_service.dart
import 'package:flutter/cupertino.dart';

class CupertinoDatePickerService {
  static Future<DateTime?> getDate(BuildContext context) async {
    DateTime? selectedDate;

    // Show Cupertino modal bottom sheet
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Select Date'),
          actions: [
            SizedBox(
              height: 216.0, // Standard height for CupertinoDatePicker
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );

    return selectedDate;
  }
}
