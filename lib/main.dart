import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra_library_app/constants.dart';

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
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: KprimaryColor
        ),

        home: const SplashView());
  }

}
