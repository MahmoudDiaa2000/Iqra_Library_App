import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_bloc.dart';
import 'package:iqra_library_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:iqra_library_app/core/open_library_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(FeaturedBooksRepo(OpenLibraryService())),
      child: const Scaffold(
        body: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}
