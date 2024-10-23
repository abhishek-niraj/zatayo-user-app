import 'package:flutter/material.dart';
import 'package:zatayo/constant/app_color.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        primary: AppColor.kPrimaryBackground,
        onPrimary: Colors.white,
        secondary: Colors.black87,
        onSecondary: Colors.white70,
        surface: AppColor.kPrimaryBackground,
        onSurface: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.white54,
        selectionHandleColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
