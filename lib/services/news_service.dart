import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import 'package:hive/hive.dart';

class NewsService {
  static const String apiKey = "3436f7c4d4c14b65b958672388ec06f6";

  static Future<List<Article>> fetchNews() async {
    final box = Hive.box('newsBox'); // 👈 THÊM

    try {
      final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // 🔥 LƯU CACHE
        await box.put('news', response.body);

        final data = json.decode(response.body);
        List articles = data['articles'];

        return articles.map((e) => Article.fromJson(e)).toList();
      }
    } catch (e) {
      print("API lỗi → dùng cache");
    }

    // 🔥 LẤY CACHE
    final cached = box.get('news');

    if (cached != null) {
      final data = json.decode(cached);
      List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    }

    throw Exception("No data available");
  }

  static Future<List<Article>> searchNews(String query) async {
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to search news");
    }
  }
}
