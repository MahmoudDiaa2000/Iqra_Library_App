import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class CustomListViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,

      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),

            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsData.book1),
            ),
          ),
        ),
      ),
    );
  }
}
