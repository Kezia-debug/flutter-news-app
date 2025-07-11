class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String? sourceUrl;
  final DateTime? publishedAt;
  final String? content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.sourceUrl,
    this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? json['content'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? '',
      sourceUrl: json['url'],
      publishedAt: json['publishedAt'] != null
          ? DateTime.tryParse(json['publishedAt'])
          : null,
      content: json['content'],
    );
  }
}
