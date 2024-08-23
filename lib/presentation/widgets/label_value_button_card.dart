import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class LabelValueButtonCard extends StatelessWidget {
  const LabelValueButtonCard({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.button_border_FF5f2bd6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SelectableText(
                      value,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.black_FF000000),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
