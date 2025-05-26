class PodcastModel {
  final String id;
  final String title;
  final String publisher;
  final String image;
  final String audio;
  final String description;
  String get author => publisher;

  PodcastModel({
    required this.id,
    required this.title,
    required this.publisher,
    required this.image,
    required this.audio,
    required this.description,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      id: json['id'] ?? '',
      title: json['title_original'] ?? 'Untitled',
      publisher: json['podcast']?['publisher'] ?? 'Unknown Publisher',
      image: json['podcast']?['image'] ?? '',
      audio: json['audio'] ?? '',
      description: json['description_original'] ?? '',
    );
  }
}
