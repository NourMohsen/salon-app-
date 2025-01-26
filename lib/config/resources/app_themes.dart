import 'package:flutter/material.dart';
import 'package:salon_app/config/responsive/responsive_extensions.dart';
import '../responsive/responsive.dart';
import 'app_colors.dart';
import 'app_constants.dart';
import 'app_text_style.dart';
import 'app_values.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: AppTextStyle.cairo,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryLightColor,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: AppColors.black,
      error: AppColors.failColor,
      onError: AppColors.white,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge32,
      displayMedium: AppTextStyle.displayMedium30,
      displaySmall: AppTextStyle.displaySmall28,
      titleLarge: AppTextStyle.titleLarge22,
      titleMedium: AppTextStyle.titleMedium20,
      titleSmall: AppTextStyle.titleSmall18,
      bodyLarge: AppTextStyle.bodyLarge16,
      bodyMedium: AppTextStyle.bodyMedium14,
      bodySmall: AppTextStyle.bodySmall12,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveManager.getHorizontalSize(AppPadding.p10),
        vertical: 0,
      ),
      hintStyle: AppTextStyle.hintTextStyle14,
      errorStyle: AppTextStyle.errorTextStyle12,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(AppConstants.appBorderRadiusR10),
        ),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppConstants.appBorderRadiusR10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(AppConstants.appBorderRadiusR10),
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: AppConstants.appBorderRadiusR10,
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.white,
      endShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12.responsiveFontSize),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: AppFontSize.sp16.responsiveFontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: AppTextStyle.cairo,
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkStroke,
      secondary: AppColors.primaryLightColor,
      surface: AppColors.black,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      error: AppColors.failColor,
      onError: AppColors.white,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge32.copyWith(color: AppColors.white),
      displayMedium: AppTextStyle.displayMedium30.copyWith(color: AppColors.white),
      displaySmall: AppTextStyle.displaySmall28.copyWith(color: AppColors.white),
      titleLarge: AppTextStyle.titleLarge22.copyWith(color: AppColors.white),
      titleMedium: AppTextStyle.titleMedium20.copyWith(color: AppColors.white),
      titleSmall: AppTextStyle.titleSmall18.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyle.bodyLarge16.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyle.bodyMedium14.copyWith(color: AppColors.white),
      bodySmall: AppTextStyle.bodySmall12.copyWith(color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ResponsiveManager.getHorizontalSize(AppPadding.p10),
        vertical: 0,
      ),
      hintStyle: AppTextStyle.hintTextStyle14,
      errorStyle: AppTextStyle.errorTextStyle12,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(AppConstants.appBorderRadiusR10),
        ),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppConstants.appBorderRadiusR10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ResponsiveManager.getSize(AppConstants.appBorderRadiusR10),
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: AppConstants.appBorderRadiusR10,
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.black,
      endShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(12.responsiveSize),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: AppTextStyle.bodyLarge16.copyWith(
        fontWeight: AppFontWeight.boldW700,
        color: AppColors.white,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    ),
  );
}