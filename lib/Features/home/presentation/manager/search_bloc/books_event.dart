abstract class BooksEvent {}

class FetchBooksEvent extends BooksEvent {
  final List<String> subjects;

  FetchBooksEvent(this.subjects);
}
