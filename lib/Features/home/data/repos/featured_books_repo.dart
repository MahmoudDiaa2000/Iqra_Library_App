import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/open_library_service.dart';

class FeaturedBooksRepo {
  final OpenLibraryService openLibraryService;

  FeaturedBooksRepo(this.openLibraryService);

  Future<List<OpenLibraryBookModel>> fetchFeaturedBooks(
      {required String query}) async {
    final results = await openLibraryService.searchBooks(query);

    if (results.isNotEmpty) {
      print('First book raw json: ${results.first}');
    }


    // DEBUG ONLY — اطبع العدد الفعلي قبل الفلترة
    print('Total results before filtering: ${results.length}');

    // فلترة الكتب اللي فيها صور و edition key فقط
    final filtered = results.where((json) =>
    json['cover_i'] != null &&
        (json['edition_key'] as List?)?.isNotEmpty == true
    );

    // DEBUG ONLY — اطبع العدد بعد الفلترة
    print('Total results after filtering: ${filtered.length}');
    print('searchBooks response length: ${results.length}');


    return filtered.map((json) => OpenLibraryBookModel.fromJson(json)).toList();
  }

}
