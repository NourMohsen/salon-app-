import 'package:flutter/material.dart';

abstract class AppConstants {


  //todo
  static List<Locale> supportedLocales = [const Locale('ar'), const Locale('en')];
  static Locale fallbackLocale = const Locale('ar');
  static Locale startLocale = const Locale('ar');
  static String localizationPath = "assets/translations";
  static String token = "token";
  static String userData = "userData";
  static String isDark = "isDark";
  static String apiKey = "11223344";
  static String lang = "lang";


  //App Border Radius
  static const double appBorderRadiusR10 = 10;
  static const double appBorderRadiusR16 = 16;

  // App Elevation
  static const double appElevationR8 = 8;

  // Scaffold Padding
  static const double appPaddingR20 = 20;
  static const double appPaddingR10 = 10;

  static const double iconSizeS20 = 20;

  static const double appLogoHeight = 110;
  static const double appLogoWidth = 110;

}
