import 'package:check_in_app/l10n/strings.dart';
import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors,
      appBar: AppBar(
        backgroundColor: AppColors.button_border_FF5f2bd6,
        title: const Text(
          AppStrings.appBarTitle,
          style: TextStyle(color: AppColors.white_FFFFFFFF),
        ),
      ),
      body: widget,
    );
  }
}
