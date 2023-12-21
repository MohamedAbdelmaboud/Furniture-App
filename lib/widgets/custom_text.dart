import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class CustomText extends StatelessWidget {
 final double? letterSpacing;

  const CustomText(this.text,
      {super.key,
      this.color = kPrimaryColor,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 20,
      this.maxLines = 100,
      this.textAlign, this.letterSpacing});
  final Color color;
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign? textAlign;
  Text pacifico() {
    return Text(
      text,
      style: GoogleFonts.pacifico(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        letterSpacing: letterSpacing,
          fontSize: fontSize, color: color, fontWeight: fontWeight),
      maxLines: maxLines,
    );
  }
}
