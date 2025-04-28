import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_List_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:iqra_library_app/core/api_service.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.fetchBooks('books'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load books'));
        } else {
          final booksJson = snapshot.data as List;
          final books = booksJson.map((json) => BookModel.fromJson(json))
              .toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomAppBar(),
                    FeaturedBooksListView(),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Best Seller', style: Styles.textStyle18),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: BestSellerListView(books: books),
              ),
            ],
          );
        }
      },
    );
  }
}


