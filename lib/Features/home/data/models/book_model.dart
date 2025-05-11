class OpenLibraryBookModel {
  final String title;
  final List<String> authors;
  final String coverImageUrl;
  final String readableUrl;
  final String? price;
  final bool isFree;
  final String? editionKey;

  OpenLibraryBookModel({
    required this.title,
    required this.authors,
    required this.coverImageUrl,
    required this.readableUrl,
    this.price,
    this.isFree = true,
    this.editionKey,
  });

  factory OpenLibraryBookModel.fromJson(Map<String, dynamic> json) {
    return OpenLibraryBookModel(
      title: json['title'] ?? 'No Title',
      authors:
          (json['author_name'] as List?)?.map((a) => a.toString()).toList() ??
          ['Unknown Author'],
      coverImageUrl:
          json['cover_i'] != null
              ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg'
              : '',
      readableUrl:
          json['key'] != null
              ? 'https://openlibrary.org${json['key']}/read'
              : '',
      price: null,
      isFree: true,
      editionKey: (json['edition_key'] as List?)?.firstOrNull,
    );
  }
}
