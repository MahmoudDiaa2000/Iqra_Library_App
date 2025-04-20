import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custem_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}
