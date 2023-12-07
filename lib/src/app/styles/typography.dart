import 'package:flutter/material.dart';
import 'package:laba_flutter/src/app/styles/font_families.dart';

abstract class AppTypography {
  const AppTypography._();

      static const labelLarge = TextStyle(
        fontFamily: FontFamilies.sfFranciscoProDisplay,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        letterSpacing: -0.35,
      );

      static const headlineLarge = TextStyle(
        fontFamily: FontFamilies.sfFranciscoProText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

      static const labelMedium = TextStyle(
        fontFamily: FontFamilies.sfFranciscoProText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: -0.33,
      );

      static const labelSmall = TextStyle(
        fontFamily: FontFamilies.sfFranciscoProText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: -0.33,
      );
    }
