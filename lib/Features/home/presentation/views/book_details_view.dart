import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  final OpenLibraryBookModel bookModel;
  final List<OpenLibraryBookModel> books;

  const BookDetailsView(
      {super.key, required this.bookModel, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(bookModel: bookModel, books: books),
    );
  }
}
