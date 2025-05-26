import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/audioBook/data/repos/podcast_repo.dart';
import 'package:iqra_library_app/Features/audioBook/presentation/manager/audio_bloc/audio_event.dart';
import 'package:iqra_library_app/Features/audioBook/presentation/manager/audio_bloc/audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final PodcastRepo repo;

  AudioBloc(this.repo) : super(AudioInitial()) {
    on<FetchAudioBooksEvent>(_onFetchPodcast);
  }

  Future<void> _onFetchPodcast(
    FetchAudioBooksEvent event,
    Emitter<AudioState> emit,
  ) async {
    emit(AudioLoading());

    try {
      final books = await repo.fetchPodcasts(search: event.query);
      books.shuffle();
      final randomBooks = books.take(10).toList();
      print(books.first.title);
      print(books.first.publisher);
      if (books.isEmpty) {
        emit(const AudioError('No audiobooks found for this keyword.'));
      } else {
        emit(AudioLoaded(books));
      }
    } catch (e) {
      emit(AudioError('Failed to load audiobooks.\nReason: ${e.toString()}'));
    }
  }
}
