import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 40),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, width: 40, height: 40),
          Text(
            ' IQRA',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),

          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(Icons.search, size: 34),
          ),
        ],
      ),
    );
  }
}
