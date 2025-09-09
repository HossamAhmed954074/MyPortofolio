import 'dart:ui';

class CustomColors {
  // Primary Colors - Professional Blue-Gray Palette
  static const Color scaffoldBg = Color(0xff0F1419);
  static const Color bgPrimary = Color(0xff1A1F2E);
  static const Color bgSecondary = Color(0xff252734);
  static const Color bgLight1 = Color(0xff2D3447);
  static const Color bgLight2 = Color(0xff383E52);

  // Accent Colors - Modern Gold & Blue
  static const Color accentPrimary = Color(0xffFFD700);
  static const Color accentSecondary = Color(0xffFFA500);
  static const Color accentTertiary = Color(0xff64B5F6);

  // Text Colors
  static const Color textPrimary = Color(0xffFFFFFF);
  static const Color textSecondary = Color(0xffE0E3E7);
  static const Color textTertiary = Color(0xffB0BEC5);
  static const Color textMuted = Color(0xff78909C);

  // Utility Colors
  static const Color success = Color(0xff4CAF50);
  static const Color warning = Color(0xffFF9800);
  static const Color error = Color(0xffF44336);
  static const Color info = Color(0xff2196F3);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xffFFD700),
    Color(0xffFFA500),
  ];

  static const List<Color> backgroundGradient = [
    Color(0xff0F1419),
    Color(0xff1A1F2E),
  ];

  static const List<Color> cardGradient = [
    Color(0xff252734),
    Color(0xff2D3447),
  ];

  // Legacy Colors (for backwards compatibility)
  static const Color scffoldBg = scaffoldBg;
  static const Color yellowPrimary = accentPrimary;
  static const Color yellowSecondary = accentSecondary;
  static const Color whitePrimary = textPrimary;
  static const Color whiteSecondary = textSecondary;
  static const Color hintDark = textMuted;
  static const Color textFieldBg = bgLight2;
}
