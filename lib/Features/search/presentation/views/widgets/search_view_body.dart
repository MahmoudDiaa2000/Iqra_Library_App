import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_list_viwe_item.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_bloc.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_event.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_state.dart';
import 'package:iqra_library_app/Features/search/presentation/views/widgets/custom_search_text_filed.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextFiled(
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              context.read<SearchBloc>().add(SearchBooksEvent(value));
            }
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchSuccess) {
                final books = state.books;
                if (books.isEmpty) {
                  return const Center(child: Text('No results found'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: BestSellerListViewItem(
                        bookModel: books[index],
                        books: books,
                      ),
                    );
                  },
                );
              } else if (state is SearchFailure) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              } else {
                return const Center(
                  child: Text('Search for a book'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
