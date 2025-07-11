import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Show Image
            if (article.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://via.placeholder.com/400x200.png?text=No+Image',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

            const SizedBox(height: 16),

            // ✅ Title
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // ✅ Published Date
            if (article.publishedAt != null)
              Text(
                'Published on: ${DateFormat.yMMMMd().format(article.publishedAt!)}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),

            const SizedBox(height: 16),

            // ✅ Full Description
            Text(
              article.description,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),

            const SizedBox(height: 24),

            // ✅ External link button
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(article.sourceUrl ?? ''),
                icon: const Icon(Icons.link),
                label: const Text('Read Full Article'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
