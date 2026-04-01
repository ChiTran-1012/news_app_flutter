class Article {
  final String title;
  final String? description;
  final String? imageUrl;
  final String? content;
  final String? author;
  final String? publishedAt;
  final String? url;

  Article({
    required this.title,
    this.description,
    this.imageUrl,
    this.content,
    this.author,
    this.publishedAt,
    this.url,
  });

  /// Convert JSON -> Object
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'],
      imageUrl: json['urlToImage'],
      content: json['content'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      url: json['url'],
    );
  }

  /// Convert Object -> JSON (nếu cần gửi ngược lên server)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'urlToImage': imageUrl,
      'content': content,
      'author': author,
      'publishedAt': publishedAt,
      'url': url,
    };
  }
}

class Source {
  final String? id;
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}