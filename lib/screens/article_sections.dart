import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/article_screen.dart'; // Import Article Reading Screen

class ArticleSectionsScreen extends StatelessWidget {
  final String category; // Pass category for filtering articles

  const ArticleSectionsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - Articles")),
      body: ListView(
        children: [
          _buildArticleItem(context, "Article 1"),
          _buildArticleItem(context, "Article 2"),
          _buildArticleItem(context, "Article 3"),
        ],
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, String title) {
    return ListTile(
      leading: Icon(Icons.article, color: Colors.brown),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(category: category, title: title), // Pass data
          ),
        );
      },
    );
  }
}
