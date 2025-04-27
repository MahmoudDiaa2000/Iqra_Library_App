import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListView(),
      ],
    );
  }
}
