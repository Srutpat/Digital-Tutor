import 'package:flutter/material.dart';
import 'package:digital_tutor_/l10n/app_localization.dart';
import 'package:digital_tutor_/screens/audio_sections.dart';
import 'package:digital_tutor_/screens/video_sections.dart';
import 'package:digital_tutor_/screens/article_sections.dart';
import 'package:digital_tutor_/screens/news_sections.dart';
import 'package:digital_tutor_/screens/facts_sections.dart';
import 'package:digital_tutor_/screens/games_sections.dart';
import 'package:digital_tutor_/screens/story_sections.dart';

class SubCategoryScreen extends StatelessWidget {
  final String category;

  const SubCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var localizedText = AppLocalization.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text("$category Sections")),
      body: ListView(
        children: getSections(context, localizedText),
      ),
    );
  }

  /// Helper function to create ListTile for each subcategory
  Widget _buildSubCategory(BuildContext context, String title, IconData icon, Color color, Widget Function(String) screenBuilder) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screenBuilder(category), // ✅ Pass category
          ),
        );
      },
    );
  }

  /// Returns the available sections for the given category
  List<Widget> getSections(BuildContext context, AppLocalization localizedText) {
    switch (category.toLowerCase()) {
      case "elderly":
        return [
          _buildSubCategory(context, localizedText.translate("audio") ?? "Audio", Icons.audiotrack, Colors.green, (cat) => AudioSection(category: cat)),
          _buildSubCategory(context, localizedText.translate("video") ?? "Video", Icons.video_library, Colors.red, (cat) => VideoSectionsScreen(category: cat)),
          _buildSubCategory(context, localizedText.translate("articles") ?? "Articles", Icons.article, Colors.blue, (cat) => ArticleSectionsScreen(category: cat,)),
        ];

      case "children":
        return [
          _buildSubCategory(context, localizedText.translate("audio") ?? "Audio", Icons.audiotrack, Colors.green, (cat) => AudioSection(category: cat)),
          _buildSubCategory(context, localizedText.translate("video") ?? "Video", Icons.video_library, Colors.red, (cat) => VideoSectionsScreen(category: cat)),
          _buildSubCategory(context, localizedText.translate("games") ?? "Games", Icons.sports_esports, Colors.orange, (cat) => GamesSectionsScreen()),
          _buildSubCategory(context, localizedText.translate("stories") ?? "Stories", Icons.book, Colors.purple, (cat) => StorySectionsScreen(category: cat)),
        ];

      case "middle age":
        return [
          _buildSubCategory(context, localizedText.translate("audio") ?? "Audio", Icons.audiotrack, Colors.green, (cat) => AudioSection(category: cat)),
          _buildSubCategory(context, localizedText.translate("video") ?? "Video", Icons.video_library, Colors.red, (cat) => VideoSectionsScreen(category: cat)),
          _buildSubCategory(context, localizedText.translate("stories") ?? "Stories", Icons.book, Colors.purple, (cat) => StorySectionsScreen(category: cat)),
        ];

      case "general":
        return [
          _buildSubCategory(context, localizedText.translate("news") ?? "News", Icons.article, Colors.orange, (cat) => NewsSectionsScreen(category: cat)),
          _buildSubCategory(context, localizedText.translate("facts") ?? "Facts", Icons.info, Colors.blue, (cat) => FactsSectionsScreen()),
        ];

      default:
        return [];
    }
  }
}
