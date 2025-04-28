class BookModel {
  final String title;
  final String authors;
  final String thumbnail;

  BookModel({
    required this.title,
    required this.authors,
    required this.thumbnail,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors:
          (json['volumeInfo']['authors'] != null)
              ? (json['volumeInfo']['authors'] as List<dynamic>).join(', ')
              : 'Unknown Author',
      thumbnail:
          (json['volumeInfo']['imageLinks'] != null)
              ? json['volumeInfo']['imageLinks']['thumbnail']
              : 'https://via.placeholder.com/150',
    );
  }
}
