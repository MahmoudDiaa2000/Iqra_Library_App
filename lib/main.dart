import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/theme/app_theme.dart';
import 'package:iqra_library_app/core/utils/app_config_provider.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppConfigProvider(),
      child: const Iqra(),
    ),
  );
}

class Iqra extends StatelessWidget {
  const Iqra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: context.watch<AppConfigProvider>().appTheme,
    );
  }
}
