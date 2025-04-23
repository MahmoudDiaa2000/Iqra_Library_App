import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:iqra_library_app/core/utils/assets.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Best Seller',
              style: Styles.textStyle18),
        ),
        SizedBox(height: 20),
        BBestSellerListViewItem()
      ],
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AssetsData.book1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                Text('Clean Code', style: Styles.textStyle20,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,)
              ],
            )

          ],
        ),
      ),
    );
  }
}




