import 'package:flutter/material.dart';
import 'package:laba_flutter/src/app/styles/colors.dart';
import 'package:laba_flutter/src/app/styles/typography.dart';

abstract class AppThemes {
  const AppThemes._();

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      background: AppColors.alabaster,
      tertiaryContainer: AppColors.mercury,
      primary: Colors.black,
      onPrimary: AppColors.shamrockGreen,
      onBackground: AppColors.shadow,
      onSecondary: AppColors.laSalleGreen,
      secondary: Colors.white,
      onTertiary:AppColors.laGrey,
    ),
    textTheme: TextTheme(
      labelLarge: AppTypography.labelLarge.copyWith(
        color:AppColors.black,
      ),
      labelMedium: AppTypography.labelMedium.copyWith(
        color: AppColors.black,
      ),
      labelSmall: AppTypography.labelSmall.copyWith(
        color: AppColors.black,
      ),
      headlineLarge: AppTypography.headlineLarge.copyWith(
        color: AppColors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}
