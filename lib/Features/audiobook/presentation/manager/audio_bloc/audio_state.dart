import 'package:equatable/equatable.dart';
import 'package:iqra_library_app/Features/audiobook/data/models/podcast_model.dart';

abstract class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object?> get props => [];
}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {}

class AudioLoaded extends AudioState {
  final List<PodcastModel> books;

  const AudioLoaded(this.books);

  @override
  List<Object?> get props => [books];
}

class AudioError extends AudioState {
  final String message;

  const AudioError(this.message);

  @override
  List<Object?> get props => [message];
}
