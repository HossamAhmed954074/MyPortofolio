import 'package:flutter/material.dart';
import '../constant/colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CustomColors.scffoldBg,
      primaryColor: CustomColors.yellowPrimary,
      colorScheme: const ColorScheme.dark(
        primary: CustomColors.yellowPrimary,
        secondary: CustomColors.yellowSecondary,
        surface: CustomColors.bgLight1,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: CustomColors.whitePrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: CustomColors.whitePrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.yellowPrimary,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CustomColors.whitePrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      cardTheme: const CardThemeData(
        color: CustomColors.bgLight2,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: CustomColors.yellowPrimary,
        foregroundColor: Colors.black,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: CustomColors.whitePrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: CustomColors.whitePrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: CustomColors.whitePrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: CustomColors.whitePrimary, fontSize: 16),
        bodyMedium: TextStyle(color: CustomColors.whiteSecondary, fontSize: 14),
        bodySmall: TextStyle(color: CustomColors.whiteSecondary, fontSize: 12),
      ),
    );
  }
}
