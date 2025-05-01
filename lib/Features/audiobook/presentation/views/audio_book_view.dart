import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_library_app/Features/audiobook/data/repos/podcast_repo.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/manager/audio_bloc/audio_bloc.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/manager/audio_bloc/audio_event.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/manager/audio_bloc/audio_state.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/views/widgets/podcast_item.dart';
import 'package:iqra_library_app/core/listen_notes_service.dart';

class AudioBookView extends StatelessWidget {
  const AudioBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AudioBloc(PodcastRepo(ListenNotesService()))
        ..add(const FetchAudioBooksEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Podcasts'),
          centerTitle: true,
        ),
        body: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            if (state is AudioLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AudioLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final podcast = state.books[index];
                  return PodcastItem(model: podcast);
                },
              );
            } else if (state is AudioError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
