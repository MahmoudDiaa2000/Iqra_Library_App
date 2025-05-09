import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initslidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTheme(
              data: IconThemeData(color: Theme.of(context).iconTheme.color),
              child: Icon(Icons.auto_stories_outlined, size: 200),
            ),
          ],
        ),

        Text(
          'IQRA',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 75,
          ),
        ),
        const SizedBox(height: 20),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: slidingAnimation,
              child: Text(
                'The more you read\nThe more you grow',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void initslidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      } else {
        GoRouter.of(context).pushReplacement('/login');
      }
    });
  }
}
