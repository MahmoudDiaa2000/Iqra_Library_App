import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_bloc.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_event.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_state.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/best_seller_List_view.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/books_error_widget.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/books_loading_widget.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return const BooksLoadingWidget();
        } else if (state is BooksFailure) {
          return BooksErrorWidget(errorMessage: state.errorMessage);
        } else if (state is BooksSuccess) {
          final books = [...state.featuredBooks, ...state.bestSellerBooks];

          if (books.isEmpty) {
            return const Center(
              child: Text(
                'No books found for this category.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<BooksBloc>().add(FetchBooksEvent(['programming']));

            },


            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      FeaturedBooksListView(books: state.featuredBooks),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Best Seller', style: Styles.textStyle18),
                      ),
                      const SizedBox(height: 20),
                      BestSellerListView(books: state.bestSellerBooks)
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

