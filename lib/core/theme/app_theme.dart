import 'package:flutter/material.dart';
import 'package:iqra_library_app/constants.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    primaryColorLight: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Color(0xffe1e1e1),

    cardColor: Colors.white54,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,

      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      // Light Mode
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xffe1e1e1),
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.SceandrColor,
      showUnselectedLabels: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    primaryColorLight: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
    // (Color 0xff141A2E)
    cardColor: AppColors.primaryDark2Color,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      // Dark Mode
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.theirColor,
      showUnselectedLabels: true,
    ),
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
