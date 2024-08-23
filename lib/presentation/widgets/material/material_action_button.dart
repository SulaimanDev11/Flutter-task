import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class MaterialActionButton extends StatelessWidget {
  const MaterialActionButton(
      {super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.button_border_FF5f2bd6,
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.white_FFFFFFFF),
      ),
    );
  }
}
