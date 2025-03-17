import 'package:flutter/material.dart';
import 'package:digital_tutor_/l10n/app_localization.dart';
import 'package:digital_tutor_/screens/CategoryCard.dart';
import 'package:digital_tutor_/screens/subcategory.dart'; // Import SubCategoryScreen

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  const HomeScreen({super.key, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    var localizedText = AppLocalization.of(context)!;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizedText.translate("choose_category") ?? "Choose Category"),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: onLanguageChange,
            itemBuilder: (context) => [
              PopupMenuItem(value: const Locale('en'), child: const Text("English")),
              PopupMenuItem(value: const Locale('hi'), child: const Text("हिन्दी")),
              PopupMenuItem(value: const Locale('mr'), child: const Text("मराठी")),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCategoryCard(
              context,
              image: "assets/elders.png",
              title: localizedText.translate("elderly"),
              color: Colors.orangeAccent,
            ),
            buildCategoryCard(
              context,
              image: "assets/children.png",
              title: localizedText.translate("children"),
              color: Colors.greenAccent,
            ),
            buildCategoryCard(
              context,
              image: "assets/middle_age.png",
              title: localizedText.translate("middle_age"),
              color: Colors.blueAccent,
            ),
            buildCategoryCard(
              context,
              image: "assets/people.png",
              title: localizedText.translate("general"),
              color: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context,
      {required String image, required String? title, required Color color}) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.22,
      child: CategoryCard(
        image: image,
        title: title ?? "Unknown",
        color: color,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCategoryScreen(category: title ?? "Unknown"), 
            ),
          );
        },
      ),
    );
  }
}
