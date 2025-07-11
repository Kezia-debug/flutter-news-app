import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsTile extends StatelessWidget {
  final NewsArticle article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // ✅ Thumbnail with placeholder support
          Container(
            width: 130,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: article.imageUrl.isNotEmpty
                  ? Image.network(
                      article.imageUrl.startsWith('http://')
                          ? article.imageUrl.replaceFirst('http://', 'https://')
                          : article.imageUrl,
                      fit: BoxFit.cover,
                      width: 130,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://via.placeholder.com/130x130.png?text=No+Image',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.network(
                      'https://via.placeholder.com/130x130.png?text=No+Image',
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          // ✅ Text Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      article.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
