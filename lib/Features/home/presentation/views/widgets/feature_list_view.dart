import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<OpenLibraryBookModel> books;

  const FeaturedBooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.3,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              final url = book.readableUrl;
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: {
                  'bookModel': book,
                  'books': books,
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: book.coverImageUrl.isNotEmpty
                      ? Image.network(
                    book.coverImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.book, size: 60),
                  )
                      : const Icon(Icons.book, size: 60),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
