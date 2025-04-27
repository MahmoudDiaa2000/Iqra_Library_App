import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_List_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/feature_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedBooksListView(),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BestSellerTitle(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Best Seller',
      style: Theme
          .of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}









