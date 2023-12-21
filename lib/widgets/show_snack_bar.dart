import 'package:flutter/material.dart';
import 'package:shop/widgets/custom_text.dart';

void showSnackBar(BuildContext context, String text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      backgroundColor: isError ? Colors.red : Colors.green,
     behavior: SnackBarBehavior.floating,
      content: Center(
        child: CustomText(
          text,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
