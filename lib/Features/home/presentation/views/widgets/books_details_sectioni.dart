import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_action.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class BooksDetailsSection extends StatelessWidget {
  final BookModel bookModel;

  const BooksDetailsSection({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: CustomBookImage(
            imageUrl: bookModel.thumbnail ?? 'https://via.placeholder.com/150',
          )
          ,
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.title,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 6),
        Text(
          bookModel.authors.isNotEmpty
              ? bookModel.authors.join(', ')
              : 'Unknown Author',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        if (bookModel.description != null) ...[
          const SizedBox(height: 20),
          Text(
            bookModel.description!,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
        ],

        const SizedBox(height: 18),
        BookRating(bookModel: bookModel),
        const SizedBox(height: 40),
        BooksAction(bookModel: bookModel),
        const SizedBox(height: 40),
      ],
    );
  }
}

