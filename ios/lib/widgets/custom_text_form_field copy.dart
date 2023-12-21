import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/constants/constants.dart';

// ignore: must_be_immutable
class CustomTextFromField extends StatefulWidget {
  CustomTextFromField(
      {super.key,
      this.suffixIcon,
      required this.prefixIcon,
      required this.hintText,
      this.obscureText=false,
      this.controller,
      this.validator,
      this.keyboardType});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData prefixIcon;
  final IconData? suffixIcon;
   bool? obscureText;
  final String hintText;
  final double iconSize = 16;
  final Color iconColor = kPrimaryColor;
  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
          //inputFormatters: [],
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText!,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              size: widget.iconSize,
              color: kPrimaryColor,
            ),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: widget.obscureText!
                        ? Icon(
                            Icons.visibility,
                            size: widget.iconSize,
                          )
                        : Icon(
                            Icons.visibility_off,
                            size: widget.iconSize,
                          ),
                    color: kPrimaryColor,
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFF919AAB),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
