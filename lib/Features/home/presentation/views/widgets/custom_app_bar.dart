import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 40),
      child: Row(
        children: [
          IconTheme(

            data: IconThemeData(color: Theme
                .of(context)
                .iconTheme
                .color),
            child: Icon(Icons.auto_stories_outlined, size: 50,),
          ),
          const SizedBox(width: 8),
          Text(
            'IQRA',
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),

        ],
      ),
    );
  }
}
