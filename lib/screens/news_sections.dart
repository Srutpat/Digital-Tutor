import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/news_screen.dart'; // Import News Screen

class NewsSectionsScreen extends StatelessWidget {
  final String category; // Category to determine content

  const NewsSectionsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - News Sections")),
      body: ListView(
        children: [
          _buildNewsItem(
            context,
            "Technology Advancements in 2024",
            "AI and Quantum Computing are revolutionizing industries worldwide...",
          ),
          _buildNewsItem(
            context,
            "Climate Change and Its Impact",
            "Rising temperatures and extreme weather patterns continue to affect millions...",
          ),
          _buildNewsItem(
            context,
            "New Innovations in Health Tech",
            "Scientists have developed a new vaccine for emerging diseases...",
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, String title, String content) {
    return ListTile(
      leading: Icon(Icons.article, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsScreen(
              category: category,
              newsTitle: title,
              newsContent: content,
            ), // Pass category, title & content
          ),
        );
      },
    );
  }
}
