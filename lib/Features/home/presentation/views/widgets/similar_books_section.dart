import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  final List<OpenLibraryBookModel> books;

  const SimilarBooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        SimilarBooksListView(books: books),
      ],
    );
  }
}
