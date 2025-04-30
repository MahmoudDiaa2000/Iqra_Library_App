import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_list_viwe_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookModel> books;

  const BestSellerListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              color: Theme
                  .of(context)
                  .dividerColor,
            ),
          ),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(bookModel: books[index], books: books,),
        );
      },
    );
  }
}
