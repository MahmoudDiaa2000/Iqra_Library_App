import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Features/splash/presentation/view_models/views/splash_view.dart';

void main() {
  runApp(const Iqra());
}

class Iqra extends StatelessWidget {
  const Iqra({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SplashView());
  }
}
