import 'dart:io';
import 'package:check_in_app/presentation/widgets/cupertino/cupertino_text_field.dart';
import 'package:check_in_app/presentation/widgets/material/material_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.enabled,
    required this.controller,
    required this.inputType,
    required this.regExp,
    this.textAlign,
    required this.maxLength,
    this.minLines,
    this.maxLines,
    this.caps,
    this.onChanged,
    this.onSubmitted,
    this.validator,
  });
  final String labelText;
  final bool enabled;
  final TextEditingController controller;
  final TextInputType inputType;
  final Pattern regExp;
  final TextAlign? textAlign;
  final int maxLength;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization? caps;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CustomCupertinoTextField(
            placeholder: labelText,
            enabled: enabled,
            controller: controller,
            inputType: inputType,
            regExp: regExp,
            maxLength: maxLength,
          )
        : MaterialTextFormField(
            labelText: labelText,
            enabled: enabled,
            controller: controller,
            inputType: inputType,
            regExp: regExp,
            maxLength: maxLength,
          );
  }
}
