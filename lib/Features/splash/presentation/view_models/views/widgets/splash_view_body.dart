import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation <Offset> slidingAnimation;

  void initState() {
    super.initState();
    initslidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(AssetsData.logo,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,),


          ],

        ),
        Text('IQRA'
          , style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 75

          ),),

        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Text('The more you read'
                    '\nThe more you grow'
                  , style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: 25

                  ),),
              );
            }
        )

      ],

    );

  }

  void initslidingAnimation() {
    animationController = AnimationController(vsync: this,
        duration: const Duration(seconds: 4));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero).animate(
            animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 10), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
      transition:
      Transition.fade;
      duration:
      Duration(seconds: 3);
    });
  }
}

