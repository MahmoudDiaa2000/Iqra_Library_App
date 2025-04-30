import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_event.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final FeaturedBooksRepo featuredBooksRepo;

  BooksBloc(this.featuredBooksRepo) : super(BooksInitial()) {
    on<FetchBooksEvent>(_onFetchBooksEvent);
  }

  Future<void> _onFetchBooksEvent(
    FetchBooksEvent event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksLoading());

    try {
      final query = event.subjects.map((s) => s).join('+');
      final books = await featuredBooksRepo.fetchFeaturedBooks(query: query);

      final half = books.length ~/ 2;
      final featuredBooks = books.take(half).toList();
      final bestSellerBooks = books.skip(half).toList();

      emit(BooksSuccess(featuredBooks, bestSellerBooks));
    } catch (e) {
      emit(BooksFailure(e.toString()));
    }
  }
}
