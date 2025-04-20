import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class FeaturedListViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}

// class FeaturedBooksListView extends StatelessWidget {
//   const FeaturedBooksListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return FeaturedListViewItem();
//       },
//     );
//   }
// }
