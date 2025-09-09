import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonStyles {
  // Primary Button
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: CustomColors.accentPrimary,
    foregroundColor: Colors.black,
    elevation: 8,
    shadowColor: CustomColors.accentPrimary.withAlpha((255 * 0.4).round()),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
  );

  // Secondary Button
  static ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    foregroundColor: CustomColors.accentPrimary,
    side: const BorderSide(color: CustomColors.accentPrimary, width: 2),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
  );

  // Ghost Button
  static ButtonStyle ghostButton = TextButton.styleFrom(
    foregroundColor: CustomColors.textSecondary,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  );
}

class AppDecorations {
  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: CustomColors.cardGradient,
    ),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: CustomColors.bgLight2.withAlpha((255 * 0.3).round()),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha((255 * 0.2).round()),
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
    ],
  );

  // Glass Morphism Effect
  static BoxDecoration glassMorphism = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withAlpha((255 * 0.1).round()),
        Colors.white.withAlpha((255 * 0.05).round()),
      ],
    ),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.white.withAlpha((255 * 0.2).round()),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha((255 * 0.1).round()),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Header Decoration
  static BoxDecoration headerDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.transparent,
        CustomColors.bgPrimary.withAlpha((255 * 0.8).round()),
      ],
    ),
    borderRadius: BorderRadius.circular(100),
  );
}
