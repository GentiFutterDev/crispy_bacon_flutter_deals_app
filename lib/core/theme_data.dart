import 'package:crispy_bacon_flutter_deals_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightCard,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.black87,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.black54,
        fontSize: 14,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.lightCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      elevation: 4,
    ),
    iconTheme: IconThemeData(
      color: AppColors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.brightYellow,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.brightYellow,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white70,
        fontSize: 14,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.darkCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      elevation: 4,
    ),
    iconTheme: IconThemeData(
      color: AppColors.brightYellow,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brightYellow,
        foregroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
