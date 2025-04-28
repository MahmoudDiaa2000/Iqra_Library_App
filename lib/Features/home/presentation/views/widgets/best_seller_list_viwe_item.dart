import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';

class BestSellerListViewItem extends StatelessWidget {
  final BookModel bookModel;

  const BestSellerListViewItem({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child:
                    bookModel.thumbnail.isNotEmpty
                        ? Image.network(bookModel.thumbnail, fit: BoxFit.cover)
                        : const Icon(Icons.book, size: 50),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.authors,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
