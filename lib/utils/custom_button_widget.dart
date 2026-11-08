// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final String btnText;
  final dynamic btnTextSize;
  final dynamic iconSize;
  final bool iconWant;
  final Color? btnTextColor;
  final Color? btnColor;
  final Color? borderColor;
  final IconData? iconData;
  final Color? suffixIconColor;
  final VoidCallback onTap;
  final Gradient? gradient;

  const CustomButtonWidget({
    super.key,
    required this.btnText,
    required this.onTap,
    this.gradient,
    this.borderColor,
    this.btnTextColor,
    this.btnTextSize,
    required this.iconWant,
    this.iconData,
    this.suffixIconColor,
    this.iconSize,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: Get.width,
        decoration: BoxDecoration(
          color: btnColor, // Set btnColor here, if provided
          gradient: gradient != null && btnColor == null
              ? LinearGradient(
                  colors: [Color(0xFF0071BC), Color(0xFF003456)],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
              : null,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconWant)
                  Icon(
                    iconData,
                    size: iconSize ?? 25,
                    color: suffixIconColor ?? Colors.white,
                  ),
                if (iconWant) SizedBox(width: 10),
                Text(
                  btnText,
                  style: GoogleFonts.openSans(
                    fontSize: btnTextSize ?? 14,
                    color: btnTextColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
