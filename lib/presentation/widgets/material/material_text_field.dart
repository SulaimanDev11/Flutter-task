import 'package:check_in_app/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialTextFormField extends StatelessWidget {
  const MaterialTextFormField({
    required this.labelText,
    required this.enabled,
    required this.controller,
    required this.inputType,
    required this.regExp,
    this.align,
    required this.maxLength,
    this.minLines,
    this.maxLines,
    this.caps,
    this.onChanged,
    this.validator,
    super.key,
  });
  final String labelText;
  final bool enabled;
  final TextEditingController controller;
  final TextInputType inputType;
  final Pattern regExp;
  final TextAlign? align;
  final int maxLength;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization? caps;
  final Function(String)? onChanged;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: caps ?? TextCapitalization.none,
      maxLength: maxLength,
      textAlign: align ?? TextAlign.left,
      enabled: enabled,
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      inputFormatters: [
        FilteringTextInputFormatter.deny(regExp),
        FilteringTextInputFormatter.deny('\''),
      ],
      onChanged: onChanged,
      decoration: InputDecoration(
        counter: const SizedBox(),
        labelText: labelText,
        filled: true,
        fillColor: AppColors.white_FFFFFFFF,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.button_border_FF5f2bd6,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.button_border_FF5f2bd6,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 3,
    );
  }
}
