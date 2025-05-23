import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/data/repos/featured_books_repo.dart';

class BooksViewModel extends ChangeNotifier {
  final FeaturedBooksRepo _featuredBooksRepo;

  BooksViewModel(this._featuredBooksRepo);

  List<BookModel> books = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchBooks() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      books = await _featuredBooksRepo.fetchBooks();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
