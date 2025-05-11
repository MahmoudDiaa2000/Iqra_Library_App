import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  final OpenLibraryBookModel bookModel;
  final List<OpenLibraryBookModel> books;

  const BestSellerListViewItem({
    super.key,
    required this.bookModel,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: {
            'bookModel': bookModel,
            'books': books,
          },
        );
      },
      child: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: bookModel.coverImageUrl.isNotEmpty
                      ? Image.network(
                      bookModel.coverImageUrl, fit: BoxFit.cover)
                      : const Icon(Icons.broken_image, size: 50),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      bookModel.authors.join(', '),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
