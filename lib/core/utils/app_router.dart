import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/home/presentation/views/book_details_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/home_view.dart';
import 'package:iqra_library_app/Features/splash/presentation/view_models/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      // GoRoute(
      //     path: kHomeView,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const HomeView();
      //     }),
      GoRoute(
        path: kHomeView,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const HomeView(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(seconds: 2),
            ),
      ),

      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return const BookDetailsView();
        },
      ),
    ],
  );
}
