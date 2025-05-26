import 'package:dio/dio.dart';

class ListenNotesService {
  final Dio _dio;

  ListenNotesService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://listen-api.listennotes.com/api/v2/',
          headers: {
            'X-ListenAPI-Key': '18b5cde821f14275a2106c946dfa15b2',

          },
        ),
      );

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.get(endpoint, queryParameters: query);
    return response.data;
  }
}
