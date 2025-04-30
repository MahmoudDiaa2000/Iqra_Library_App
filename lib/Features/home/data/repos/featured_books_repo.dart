import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/api_service.dart';

class FeaturedBooksRepo {
  final ApiService apiService;

  FeaturedBooksRepo(this.apiService);

  Future<List<BookModel>> fetchFeaturedBooks({required String query}) async {
    final response = await apiService.get(
      endPoint: 'volumes?q=$query&startIndex=0&maxResults=20',
    );

    List<BookModel> books = [];
    for (var item in response['items']) {
      try {
        books.add(BookModel.fromJson(item));
      } catch (e) {
        continue; // تجاهل الكتاب اللي فيه مشكلة
      }
    }

    return books;
  }
}
