import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final TextAlign textAlign; // Add TextAlign parameter

  const CommonTextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing = -0.3,
    this.textAlign = TextAlign.start, // Default alignment is TextAlign.start

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.workSans(
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
