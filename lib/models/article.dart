import 'source.dart';

class Article {
  final String title;
  final String? description;
  final String? imageUrl;
  final String? content;
  final String? author;
  final String? publishedAt;
  final String? url;

  final Source source; // 👈 thêm dòng này

  Article({
    required this.title,
    this.description,
    this.imageUrl,
    this.content,
    this.author,
    this.publishedAt,
    this.url,
    required this.source, // 👈 thêm
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'],
      imageUrl: json['urlToImage'],
      content: json['content'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      source: Source.fromJson(json['source'] ?? {}), // 👈 thêm
    );
  }
}