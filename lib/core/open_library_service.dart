import 'package:dio/dio.dart';

class OpenLibraryService {
  final Dio _dio;

  OpenLibraryService()
    : _dio = Dio(BaseOptions(baseUrl: 'https://openlibrary.org/'));

  Future<List<Map<String, dynamic>>> searchBooks(String query) async {
    final response = await _dio.get(
      'search.json',
      queryParameters: {'q': query},
    );
    final docs = response.data['docs'] as List?;

    if (docs == null) return [];

    return docs.cast<Map<String, dynamic>>();
  }

  Future<Map<String, dynamic>?> fetchBookDetailsByEditionKey(
    String editionKey,
  ) async {
    try {
      final response = await _dio.get(
        'api/books',
        queryParameters: {
          'bibkeys': 'OLID:$editionKey',
          'format': 'json',
          'jscmd': 'data',
        },
      );

      return response.data['OLID:$editionKey'];
    } catch (e) {
      print('Error fetching book details: $e');
      return null;
    }
  }
}
