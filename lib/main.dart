import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_bloc.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_event.dart';
import 'package:iqra_library_app/core/api_service.dart';
import 'package:iqra_library_app/core/theme/app_theme.dart';
import 'package:iqra_library_app/core/utils/app_config_provider.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppConfigProvider()),
        BlocProvider(
          create:
              (_) => BooksBloc(FeaturedBooksRepo(ApiService()))..add(
                FetchBooksEvent([
                  'science',
                  'technology',
                  'self-development',
                  'programming',
                ]),
              ),
        ),
      ],
      child: const IqraLibraryApp(),
    ),
  );
}

class IqraLibraryApp extends StatelessWidget {
  const IqraLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context); // ✅ خد instance

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: appConfig.appTheme,
      // ✅ استخدمها من الـ instance
      debugShowCheckedModeBanner: false,
    );
  }
}
