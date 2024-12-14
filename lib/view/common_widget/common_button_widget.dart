import 'package:flutter/material.dart';
import 'common_text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double borderRadius;
  final double? width;  // Optional width
  final double? height; // Optional height

  const CommonButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor = const Color(0xFFF8470E),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = -0.05,
    this.borderRadius = 8,
    this.width, // Allow setting the button width
    this.height, // Allow setting the button height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use the width provided or wrap content
      height: height ?? 55, // Use the height provided or wrap content
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Button border radius
          ),
          // padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16), // Button padding
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonTextWidget(
              text: text,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
            if (icon != null) ...[
              const SizedBox(width: 12), // Space between text and icon
              Icon(icon, size: 20, color: textColor),
            ],
          ],
        ),
      ),
    );
  }
}
