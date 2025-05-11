import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_action.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  final OpenLibraryBookModel bookModel;

  const BooksDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl: bookModel.coverImageUrl.isNotEmpty
                ? bookModel.coverImageUrl
                : 'https://via.placeholder.com/150',
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            bookModel.title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          bookModel.authors.isNotEmpty
              ? bookModel.authors.join(', ')
              : 'Unknown Author',
          style: Theme
              .of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        BookRating(bookModel: bookModel),
        const SizedBox(height: 32),
        BooksAction(bookModel: bookModel),
        const SizedBox(height: 30),
      ],
    );
  }
}
