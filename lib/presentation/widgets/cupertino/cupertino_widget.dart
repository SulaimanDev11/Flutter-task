import 'package:check_in_app/l10n/strings.dart';
import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidget extends StatelessWidget {
  const CupertinoWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_FFF4F1F6,
      body: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: AppColors.button_border_FF5f2bd6,
          middle: Text(
            AppStrings.appBarTitle,
            style: TextStyle(color: AppColors.black_FF000000),
          ),
        ),
        child: widget,
      ),
    );
  }
}
