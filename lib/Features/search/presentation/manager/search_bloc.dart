import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_event.dart';
import 'package:iqra_library_app/Features/search/presentation/manager/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FeaturedBooksRepo featuredBooksRepo;

  SearchBloc(this.featuredBooksRepo) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchBooksEvent) {
        emit(SearchLoading());
        try {
          final books = await featuredBooksRepo.fetchFeaturedBooks(
            query: event.query,
          );
          emit(SearchSuccess(books));
        } catch (e) {
          emit(SearchFailure(e.toString()));
        }
      }
    });
  }
}
