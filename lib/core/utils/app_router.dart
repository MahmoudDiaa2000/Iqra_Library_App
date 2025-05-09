import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/Profile/presentation/views/profile_view.dart';
import 'package:iqra_library_app/Features/audiobook/data/models/podcast_model.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/views/auido_player_view.dart';
import 'package:iqra_library_app/Features/auth/presentation/views/login_view.dart';
import 'package:iqra_library_app/Features/auth/presentation/views/signup_view.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/book_details_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/home_view.dart';
import 'package:iqra_library_app/Features/search/presentation/views/search_view.dart';
import 'package:iqra_library_app/Features/splash/presentation/view_models/views/splash_view.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kAudioBookView = 'audiobookView';
  static const kAudioPlayerView = '/audioPlayer';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kProfileView = '/profileView';
  static const kLoginView = '/login';
  static const kSignUpView = '/signup';



  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),


      GoRoute(
        path: kAudioPlayerView,
        builder: (context, state) {
          final podcast = state.extra as PodcastModel;
          return AudioPlayerView(audio: podcast);
        },
      ),

      GoRoute(
        path: AppRouter.kAudioPlayerView,
        builder: (context, state) {
          final podcast = state.extra as PodcastModel;
          return AudioPlayerView(audio: podcast);
        },
      ),


      GoRoute(
          path: kSearchView,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchView();
          }),
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
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final book = data['bookModel'] as BookModel;
          final books = data['books'] as List<BookModel>;

          return CustomTransitionPage(
            key: state.pageKey,
            child: BookDetailsView(bookModel: book, books: books),
            transitionsBuilder: (context, animation, secondaryAnimation,
                child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),


    ],
  );
}
