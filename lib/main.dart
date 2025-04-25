import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/theme/app_theme.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

void main() {
  runApp(const Iqra());
}

class Iqra extends StatelessWidget {
  const Iqra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
    );
  }
}
