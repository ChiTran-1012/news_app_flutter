import 'package:flutter/material.dart';
import '../../../services/news_service.dart';
import '../../../models/article.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<Article>>? futureSources;

  @override
  void initState() {
    super.initState();
    futureSources = NewsService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: futureSources,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.author ?? "Unknown"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}