import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_assistant.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/books_details_sectioni.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  final List<BookModel> books;

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
                Center(
                  child: FilledButton.icon(

                    onPressed: () => BookAssistant.show(context, bookModel),
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                      foregroundColor: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.psychology_alt_rounded),
                    label: Text(
                      'Ask AI',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),


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
