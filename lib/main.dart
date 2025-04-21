import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra_library_app/core/theme/app_theme.dart';

import 'Features/splash/presentation/view_models/views/splash_view.dart';

void main() {
  runApp(const Iqra());
}

class Iqra extends StatelessWidget {
  const Iqra({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,

        home: const SplashView());
  }

}
