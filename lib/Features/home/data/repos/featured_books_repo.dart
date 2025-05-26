import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/api_service.dart';

class FeaturedBooksRepo {
  final ApiService apiService;

  FeaturedBooksRepo(this.apiService);

  Future<List<BookModel>> fetchBooks() async {
    final data = await apiService.get(
      endPoint: 'volumes?q=subject:technology&timestamp=${DateTime
          .now()
          .millisecondsSinceEpoch}',
    );

    final booksJson = data['items'] as List?;

    if (booksJson == null) return [];

    return booksJson.map((json) => BookModel.fromJson(json)).toList();
  }


  Future<List<BookModel>> fetchFeaturedBooks({required String query}) async {
    print('📥 Fetching from Google Books API with query: $query');

    final data = await apiService.get(
        endPoint: 'volumes?q=$query&maxResults=20');

    final booksJson = data['items'] as List?;

    if (booksJson == null) return [];
    print('📥 Fetching from Google Books API with query: $query');


    return booksJson.map((json) => BookModel.fromJson(json)).toList();
  }
}
