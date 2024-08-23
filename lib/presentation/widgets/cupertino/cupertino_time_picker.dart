import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimePickerService {
  static Future<TimeOfDay?> getTime(BuildContext context) async {
    TimeOfDay? selectedTime;

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        TimeOfDay initialTime = TimeOfDay.now();
        return CupertinoActionSheet(
          title: const Text('Select Time'),
          actions: [
            SizedBox(
              height: 216.0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  initialTime.hour,
                  initialTime.minute,
                ),
                onDateTimeChanged: (DateTime newDateTime) {
                  selectedTime = TimeOfDay(
                    hour: newDateTime.hour,
                    minute: newDateTime.minute,
                  );
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

    return selectedTime;
  }
}
