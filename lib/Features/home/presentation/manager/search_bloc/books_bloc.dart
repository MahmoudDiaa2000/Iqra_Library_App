import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_event.dart';
import 'package:iqra_library_app/Features/home/presentation/manager/search_bloc/books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final FeaturedBooksRepo featuredBooksRepo;

  BooksBloc(this.featuredBooksRepo) : super(BooksInitial()) {
    on<FetchBooksEvent>(_onFetchBooksEvent);
  }

  Future<void> _onFetchBooksEvent(FetchBooksEvent event,
      Emitter<BooksState> emit,) async {
    // Force rebuild even if same data comes
    emit(BooksInitial());
    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final timestamp = DateTime.now().second;
      final query = '${event.subjects.join('+')}+$timestamp';

      // Append timestamp to bypass caching
      final books = await featuredBooksRepo.fetchFeaturedBooks(
        query: '$query&timestamp=${DateTime.now().millisecondsSinceEpoch}',
      );

      final half = books.length ~/ 2;
      final featuredBooks = books.take(half).toList();
      final bestSellerBooks = books.skip(half).toList();

      emit(BooksSuccess(featuredBooks, bestSellerBooks));
    } catch (e) {
      emit(BooksFailure(e.toString()));
    }
  }
}
