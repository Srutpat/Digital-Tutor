import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/facts_screen.dart'; // Screen to display facts

class FactsSectionsScreen extends StatelessWidget {
  const FactsSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("General Facts")),
      body: ListView(
        children: [
          _buildFactItem(context, "Fact 1"),
          _buildFactItem(context, "Fact 2"),
          _buildFactItem(context, "Fact 3"),
        ],
      ),
    );
  }

  Widget _buildFactItem(BuildContext context, String title) {
    return ListTile(
      leading: Icon(Icons.info, color: Colors.purple),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FactsScreen()),
        );
      },
    );
  }
}
