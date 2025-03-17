import 'package:flutter/material.dart';
import 'package:digital_tutor_/screens/video_screen.dart'; // Import Video Player Screen

class VideoSectionsScreen extends StatelessWidget {
  final String category; // Category to determine content

  const VideoSectionsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - Video Sections")),
      body: ListView(
        children: [
          _buildVideoItem(context, "Video 1", "video1_url"),
          _buildVideoItem(context, "Video 2", "video2_url"),
          _buildVideoItem(context, "Video 3", "video3_url"),
        ],
      ),
    );
  }

  Widget _buildVideoItem(BuildContext context, String title, String videoUrl) {
    return ListTile(
      leading: Icon(Icons.video_library, color: Colors.red),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(
              category: category, 
              videoTitle: title, 
              videoUrl: videoUrl,
            ), // Pass category, video title & URL
          ),
        );
      },
    );
  }
}
