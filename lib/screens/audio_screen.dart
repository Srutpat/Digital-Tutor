import 'package:flutter/material.dart';

class AudioScreen extends StatelessWidget {
  final String category;

  const AudioScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$category - Audios"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          "List of Audios for $category",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
