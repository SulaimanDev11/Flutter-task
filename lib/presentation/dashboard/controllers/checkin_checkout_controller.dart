import 'package:check_in_app/data/usecase/get_date_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/params/params.dart';
import '../../../data/usecase/save_data_usecase.dart';
import '../../../utils/loader/loader.dart';

class CheckInCheckOutController extends GetxController {
  final SaveUserUsecase saveUserUsecase;
  final GetDateUsecase getDateUsecase;
  CheckInCheckOutController(
      {required this.saveUserUsecase, required this.getDateUsecase})
      : super();

  DateTime checkinDateTime = DateTime.now();
  DateTime checkoutDateTime = DateTime.now();
  RxList<BreakTimeParams>? breakTimes = <BreakTimeParams>[].obs;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  Rx<DateTime> checkInDate = DateTime.now().obs;
  Rx<DateTime> checkOutDate = DateTime.now().obs;

  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<TimeOfDay> startTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> endTime = TimeOfDay.now().obs;

  Future<void> saveUserData(SaveUserParams params, context) async {
    loading(context);
    try {
      final res = await saveUserUsecase(params);
      if (res) {
        debugPrint('Data saved');
      }
      debugPrint('Data not saved');
      Navigator.pop(context);
    } catch (error) {
      Navigator.pop(context);
      // Handle error
    }
  }

  Future<void> getDate(context) async {
    try {
      final res = await getDateUsecase(context);
      if (res != null) {
        debugPrint(res.toString());
      }
    } catch (error) {
      Navigator.pop(context);
    }
  }
}
