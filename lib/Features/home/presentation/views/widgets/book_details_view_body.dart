import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/books_details_sectioni.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                SafeArea(child: CustomBookDetailsAppBar()),

                BookDetailsSection(),
                SimilarBooksSection(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}