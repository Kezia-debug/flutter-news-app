// lib/services/news_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  static const String _apiKey = 'acf45cebe4ed4fa28cb43ac7db1c442b'; // Replace this!
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us';

  static Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse("$_baseUrl&apiKey=$_apiKey"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];

      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
