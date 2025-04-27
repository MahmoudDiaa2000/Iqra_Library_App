import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_action.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SafeArea(child: CustomBookDetailsAppBar()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                  child: CustomBookImage(),
                ),
                const SizedBox(height: 43),
                Text('Clean Code', style: Styles.textStyle30),
                const SizedBox(height: 6),
                Text(
                  'Robert C. Martin',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 18),
                const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                const SizedBox(height: 40),
                const BooksAction(),
                const Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const SimilarBooksListView(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}






