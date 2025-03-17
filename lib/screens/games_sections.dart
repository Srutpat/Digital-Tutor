import 'package:flutter/material.dart';

class GamesSectionsScreen extends StatelessWidget {
  const GamesSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Games Section")),
      body: Center(child: Text("List of Games will be displayed here.")),
    );
  }
}
