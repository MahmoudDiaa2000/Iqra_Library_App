import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode appTheme;

  AppConfigProvider()
    : appTheme =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                  Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light;

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) return;
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() => appTheme == ThemeMode.dark;
}
