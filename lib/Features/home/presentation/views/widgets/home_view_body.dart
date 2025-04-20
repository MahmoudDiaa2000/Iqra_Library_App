import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/feature_list_view.dart';
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
          child: Text('Bast Seller', style: Styles.titleMedium),
        ),
      ],
    );
  }
}



