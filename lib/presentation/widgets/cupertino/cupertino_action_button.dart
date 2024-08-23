import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/cupertino.dart';

class CupertinoActionButton extends StatelessWidget {
  const CupertinoActionButton(
      {super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      focusColor: AppColors.button_border_FF5f2bd6,
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.white_FFFFFFFF),
      ),
    );
  }
}
