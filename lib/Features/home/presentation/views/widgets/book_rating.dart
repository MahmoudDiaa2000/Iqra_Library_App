import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';

class BookRating extends StatelessWidget {
  final OpenLibraryBookModel bookModel;
  final MainAxisAlignment mainAxisAlignment;

  const BookRating({
    super.key,
    required this.bookModel,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, size: 14, color: Colors.amber),
        const SizedBox(width: 6.3),
        Text(
          'Not rated',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
