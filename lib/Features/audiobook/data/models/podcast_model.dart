class PodcastModel {
  final String id;
  final String title;
  final String publisher;
  final String image;
  final String audio;

  String get author => publisher;

  PodcastModel({
    required this.id,
    required this.title,
    required this.publisher,
    required this.image,
    required this.audio,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      id: json['id'] ?? '',
      title: json['title_original'] ?? 'Untitled',
      publisher: json['podcast']?['publisher'] ?? 'Unknown Publisher',
      image: json['podcast']?['image'] ?? '',
      audio: json['audio'] ?? '',
    );
  }
}
