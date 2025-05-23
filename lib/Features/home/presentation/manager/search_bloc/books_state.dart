import 'package:iqra_library_app/Features/home/data/models/book_model.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  final List<BookModel> featuredBooks;
  final List<BookModel> bestSellerBooks;

  BooksSuccess(this.featuredBooks, this.bestSellerBooks);
}

class BooksFailure extends BooksState {
  final String errorMessage;

  BooksFailure(this.errorMessage);
}
