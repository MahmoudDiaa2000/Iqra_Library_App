import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/search/presentation/views/widgets/custom_search_text_filed.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchText()

        ],
      ),
    );
  }
}


