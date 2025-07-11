// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/news_tile.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';
import 'news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsArticle> _allArticles = [];
  List<NewsArticle> _filteredArticles = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() async {
    try {
      final articles = await NewsService.fetchNews();
      setState(() {
        _allArticles = articles;
        _filteredArticles = articles;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _filterArticles(String query) {
    setState(() {
      _filteredArticles = _allArticles.where((article) {
        final lowerQuery = query.toLowerCase();
        return article.title.toLowerCase().contains(lowerQuery) ||
            article.description.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'News App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CustomSearchBar(onSearch: _filterArticles),
              const SizedBox(height: 16),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                        ? Center(child: Text('Error: $_error'))
                        : _filteredArticles.isEmpty
                            ? const Center(child: Text('No articles found.'))
                            : ListView.builder(
                                itemCount: _filteredArticles.length,
                                itemBuilder: (context, index) {
                                  return MouseRegion(
                                    cursor: SystemMouseCursors.click, // 👈 Cursor becomes hand on hover
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => NewsDetailScreen(
                                              article: _filteredArticles[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: NewsTile(
                                        article: _filteredArticles[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
