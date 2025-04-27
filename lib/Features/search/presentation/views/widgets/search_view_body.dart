import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_list_viwe_item.dart'
    show BestSellerListViewItem;
import 'package:iqra_library_app/Features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextFiled(),
          SizedBox(
            height: 16,
          ),

          Text('Search Result', style: Styles.textStyle18,),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultListView())

        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const BestSellerListViewItem(),
        );
      },
    );;
  }
}

