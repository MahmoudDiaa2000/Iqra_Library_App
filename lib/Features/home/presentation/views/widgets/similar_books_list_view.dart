import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class SimilarBooksListView extends StatelessWidget {
  final List<OpenLibraryBookModel> books;
  const SimilarBooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: {
                  'bookModel': book,
                  'books': books,
                },
              );
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                book.coverImageUrl.isNotEmpty
                    ? book.coverImageUrl
                    : 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                width: 100,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.book),
              ),

            ),
          );
        },
      ),
    );
  }
}
