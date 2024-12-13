import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final TextAlign textAlign; // Add TextAlign parameter
  final TextOverflow overflow; // Add overflow parameter

  const CommonTextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing = -0.3,
    this.textAlign = TextAlign.start, // Default alignment is TextAlign.start
    this.overflow = TextOverflow.clip, // Default overflow is TextOverflow.clip
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow, // Add overflow property here
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
