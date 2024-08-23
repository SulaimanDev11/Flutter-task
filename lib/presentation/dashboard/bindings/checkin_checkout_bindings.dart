import 'package:check_in_app/presentation/dashboard/controllers/checkin_checkout_controller.dart';
import 'package:get/get.dart';

import '../../../data/di/di.dart';

class CheckinCheckoutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckInCheckOutController>(
      () => CheckInCheckOutController(
          saveUserUsecase: sl(), getDateUsecase: sl()),
    );
  }
}
