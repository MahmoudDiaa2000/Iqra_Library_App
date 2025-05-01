class BookModel {
  final String title;
  final List<String> authors;
  final String? thumbnail;
  final String? description;
  final String? previewLink;
  final String? buyLink;
  final String? accessLink;
  final String? price;
  final bool isFree;
  final String? infoLink;
  final double? averageRating;
  final int? ratingsCount;

  BookModel({
    required this.title,
    required this.authors,
    this.thumbnail,
    this.description,
    this.previewLink,
    this.buyLink,
    this.accessLink,
    this.price,
    required this.isFree,
    this.infoLink,
    this.averageRating,
    this.ratingsCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final saleInfo = json['saleInfo'] ?? {};
    final accessInfo = json['accessInfo'] ?? {};

    return BookModel(
      title: volumeInfo['title'] ?? 'No Title',
      authors:
          (volumeInfo['authors'] as List?)?.cast<String>() ??
          ['Unknown Author'],
      thumbnail: volumeInfo['imageLinks']?['thumbnail'],
      description: volumeInfo['description'],
      previewLink: volumeInfo['previewLink'],
      buyLink: saleInfo['buyLink'],
      accessLink: accessInfo['webReaderLink'],
      price: saleInfo['listPrice']?['amount']?.toString(),
      isFree: saleInfo['saleability'] == 'FREE',
      infoLink: volumeInfo['infoLink'],
      averageRating: (volumeInfo['averageRating'] as num?)?.toDouble(),
      ratingsCount: volumeInfo['ratingsCount'] as int?,
    );
  }
}
