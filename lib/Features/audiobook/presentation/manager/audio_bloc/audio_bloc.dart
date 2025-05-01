import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/audiobook/data/repos/podcast_repo.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/manager/audio_bloc/audio_event.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/manager/audio_bloc/audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final PodcastRepo repo;

  AudioBloc(this.repo) : super(AudioInitial()) {
    on<FetchAudioBooksEvent>(_onFetchAudioBooks);
  }

  Future<void> _onFetchAudioBooks(
    FetchAudioBooksEvent event,
    Emitter<AudioState> emit,
  ) async {
    emit(AudioLoading());

    try {
      final books = await repo.fetchPodcasts(search: event.query);
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
