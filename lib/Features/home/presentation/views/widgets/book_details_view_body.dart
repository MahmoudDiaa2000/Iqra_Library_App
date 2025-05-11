import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/books_details_sectioni.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final OpenLibraryBookModel bookModel;
  final List<OpenLibraryBookModel> books;


  const BookDetailsViewBody(
      {super.key, required this.bookModel, required this.books});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SafeArea(child: CustomBookDetailsAppBar()),
                BooksDetailsSection(bookModel: bookModel),


                SimilarBooksSection(books: books),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
