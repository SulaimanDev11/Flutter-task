import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({
    required this.placeholder,
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
    super.key,
  });

  final String placeholder;
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
    return CupertinoTextField(
      controller: controller,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.left,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      maxLength: maxLength,
      textCapitalization: caps ?? TextCapitalization.none,
      keyboardType: inputType,
      inputFormatters: [
        FilteringTextInputFormatter.deny(regExp),
        FilteringTextInputFormatter.deny("'"),
      ],
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      placeholder: placeholder,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: CupertinoColors.systemGrey.withOpacity(0.5),
        ),
        color: CupertinoColors.white,
      ),
      placeholderStyle: const TextStyle(
        color: CupertinoColors.systemGrey,
      ),
      style: const TextStyle(
        color: CupertinoColors.black,
      ),
    );
  }
}
