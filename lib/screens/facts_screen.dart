import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/facts_detail_screen.dart'; // Import Fact Detail Screen

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("General Facts")),
      body: ListView(
        children: [
          _buildFactItem(context, "Fact 1", "This is the first fact."),
          _buildFactItem(context, "Fact 2", "This is the second fact."),
          _buildFactItem(context, "Fact 3", "This is the third fact."),
        ],
      ),
    );
  }

  Widget _buildFactItem(BuildContext context, String title, String content) {
    return ListTile(
      leading: Icon(Icons.lightbulb, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FactDetailScreen(title: title, content: content), // Pass data
          ),
        );
      },
    );
  }
}
