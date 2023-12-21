import 'package:flutter/material.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:shop/widgets/custom_text_form_field.dart';

class CustomColumn extends StatelessWidget {
  final String text;

  final String hintText;

  final IconData prefixIcon;
  final void Function(String)? onChanged;
    final String? Function(String?)? validator;
  const CustomColumn(
      {super.key,
      required this.text,
      required this.hintText,
      required this.prefixIcon,
      this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text,
              fontSize: 14,
            ),
          ],
        ),
        CustomTextFromField(
          prefixIcon: prefixIcon,
          hintText: hintText,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
