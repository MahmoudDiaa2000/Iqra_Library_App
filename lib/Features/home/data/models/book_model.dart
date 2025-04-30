class BookModel {
  final String title;
  final List<String> authors;
  final String? image;
  final String? thumbnail;
  final String? description;
  final double? averageRating;
  final int? ratingsCount;
  final String? previewLink;
  final String? accessLink;
  final String? price;
  final String? buyLink;
  final bool isFree;

  BookModel({
    required this.title,
    required this.authors,
    this.image,
    this.thumbnail,
    this.description,
    this.averageRating,
    this.ratingsCount,
    this.previewLink,
    this.accessLink,
    this.price,
    this.buyLink,
    required this.isFree,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final saleInfo = json['saleInfo'] ?? {};
    final accessInfo = json['accessInfo'] ?? {};

    return BookModel(
      title: volumeInfo['title'] ?? 'No Title',
      authors: (volumeInfo['authors'] as List?)?.cast<String>() ?? [],
      image: volumeInfo['imageLinks']?['smallThumbnail'],
      thumbnail: volumeInfo['imageLinks']?['thumbnail'],
      description: volumeInfo['description'],
      averageRating: (volumeInfo['averageRating'] as num?)?.toDouble(),
      ratingsCount: volumeInfo['ratingsCount'],
      previewLink: volumeInfo['previewLink'],
      accessLink: accessInfo['webReaderLink'],
      buyLink: saleInfo['buyLink'],
      price: saleInfo['retailPrice']?['amount']?.toString(),
      isFree: saleInfo['saleability'] == 'FREE',
    );
  }
}

