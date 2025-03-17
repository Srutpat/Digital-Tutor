import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/story_screen.dart'; // Import Story Screen

class StorySectionsScreen extends StatelessWidget {
  final String category; // Category to determine content

  const StorySectionsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - Story Sections")),
      body: ListView(
        children: [
          _buildStoryItem(context, "Story 1", "Once upon a time..."),
          _buildStoryItem(context, "Story 2", "Long ago, in a faraway land..."),
          _buildStoryItem(context, "Story 3", "There was a wise old man..."),
        ],
      ),
    );
  }

  Widget _buildStoryItem(BuildContext context, String title, String content) {
    return ListTile(
      leading: Icon(Icons.book, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryScreen(
              category: category,
              storyTitle: title,
              storyContent: content,
            ), // Pass category, title & content
          ),
        );
      },
    );
  }
}
