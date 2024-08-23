import 'package:check_in_app/data/di/di.dart';
import 'package:check_in_app/l10n/strings.dart';
import 'package:check_in_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'presentation/dashboard/view/checkin_checkout_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Di.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appBarTitle,
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CheckInCheckOutScreen(),
    );
  }
}
