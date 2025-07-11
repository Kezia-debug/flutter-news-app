// models/news_article.dart
class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String? sourceUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.sourceUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? '',
      sourceUrl: json['url'],
    );
  }
}
