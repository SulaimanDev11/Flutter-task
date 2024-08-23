import 'package:check_in_app/presentation/dashboard/bindings/checkin_checkout_bindings.dart';
import 'package:check_in_app/presentation/dashboard/view/checkin_checkout_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHECKINCHECKOUT;

  static final routes = [
    GetPage(
      name: _Paths.CHECKINCHECKOUT,
      page: () => CheckInCheckOutScreen(),
      binding: CheckinCheckoutBindings(),
    ),
  ];
}
