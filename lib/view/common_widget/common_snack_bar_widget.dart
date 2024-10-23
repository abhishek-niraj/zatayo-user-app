import 'package:flutter/material.dart';
import 'common_text_widget.dart';

void showSSnackBar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CommonTextWidget(
        text: text,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating, // Set the behavior to floating
      margin: const EdgeInsets.all(10),
    ),
  );
}
