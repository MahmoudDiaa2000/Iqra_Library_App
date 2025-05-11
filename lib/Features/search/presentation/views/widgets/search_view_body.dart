import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/pdf_viewer_page.dart';
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
                final List<OpenLibraryBookModel> books = state.books;
                if (books.isEmpty) {
                  return const Center(child: Text('No results found'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: book.coverImageUrl.isNotEmpty
                            ? Image.network(
                            book.coverImageUrl, width: 50, fit: BoxFit.cover)
                            : const Icon(Icons.book, size: 40),
                        title: Text(book.title, maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        subtitle: Text(book.authors.join(', ')),
                        onTap: () {
                          final editionKey = book.editionKey;

                          if (editionKey == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text(
                                  'No edition available for this book')),
                            );
                            return;
                          }

                          final pdfUrl = 'https://openlibrary.org/books/$editionKey.pdf'; // لاحقاً نتحقق لو فعلاً PDF

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PDFViewerPage(pdfUrl: pdfUrl),
                            ),
                          );
                        },

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
