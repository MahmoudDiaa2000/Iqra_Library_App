import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kHomeView);
          }
          ,
          icon: Icon(
            Icons.close,
            color: Theme
                .of(context)
                .iconTheme
                .color,
          ),
        ),
      ],
    );
  }
}
