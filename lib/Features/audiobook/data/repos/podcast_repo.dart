import 'package:iqra_library_app/Features/audiobook/data/models/podcast_model.dart';
import 'package:iqra_library_app/core/listen_notes_service.dart';

class PodcastRepo {
  final ListenNotesService service;

  PodcastRepo(this.service);

  Future<List<PodcastModel>> fetchPodcasts({String? search}) async {
    try {
      final response = await service.get(
        endpoint: 'search',
        query: {
          'q': search ?? 'technology',
          'type': 'episode',
          'len_min': 5,
          'len_max': 30,
        },
      );

      final List episodes = response['results'];
      return episodes.map((json) => PodcastModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching podcasts: $e');
    }
  }
}
