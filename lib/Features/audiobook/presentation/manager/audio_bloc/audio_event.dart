import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object?> get props => [];
}

class FetchAudioBooksEvent extends AudioEvent {
  final String query;

  const FetchAudioBooksEvent({this.query = 'science'});

  @override
  List<Object?> get props => [query];
}
