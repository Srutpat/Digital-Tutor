import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/audio_screen.dart'; // Screen to play audio

class AudioSection extends StatelessWidget {
  final String category; // Category to determine content

  const AudioSection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - Audio Sections")),
      body: ListView(
        children: [
          _buildAudioItem(context, "Audio 1"),
          _buildAudioItem(context, "Audio 2"),
          _buildAudioItem(context, "Audio 3"),
        ],
      ),
    );
  }

  Widget _buildAudioItem(BuildContext context, String title) {
    return ListTile(
      leading: Icon(Icons.audiotrack, color: Colors.green),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AudioScreen(category: category), // Pass category
          ),
        );
      },
    );
  }
}
