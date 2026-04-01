import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String apiKey = "3436f7c4d4c14b65b958672388ec06f6";

  static Future<List<Article>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }

    
  }
}
