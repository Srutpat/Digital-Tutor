import 'package:flutter/material.dart';
import 'package:digital_tutor_/l10n/app_localization.dart';
import 'video_player_screen.dart';

class VideoListScreen extends StatelessWidget {
  final String sectionName;

  const VideoListScreen({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    final AppLocalization? localizations = AppLocalization.of(context);

    final Map<String, List<Map<String, String>>> sectionVideos = {
      "whatsapp": [
        {
          "title": localizations?.translate("whatsapp_video_call") ?? "WhatsApp Video Call",
          "path": "assets/videos/whatsapp_videocall.mp4"
        },
      ],
      "youtube": [
        {
          "title": localizations?.translate("youtube_watch_video") ?? "Watch YouTube Video",
          // "path": "assets/videos/youtube_watch.mp4"
        },
      ],
      "google_pay": [
        {
          "title": localizations?.translate("google_pay_payment") ?? "Google Pay Payment",
          // "path": "assets/videos/google_pay_payment.mp4"
        },
      ],
      "phone_settings": [
        {
          "title": localizations?.translate("phone_settings_tutorial") ?? "Phone Settings Tutorial",
          // "path": "assets/videos/phone_settings.mp4"
        },
      ],
      "general_phone": [
        {
          "title": localizations?.translate("general_phone_usage") ?? "General Phone Usage",
          // "path": "assets/videos/general_phone.mp4"
        },
      ],
    };

    final videos = sectionVideos[sectionName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.translate("video_sections") ?? "Video Sections"),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.play_circle_fill, color: Colors.blue, size: 40),
            title: Text(videos[index]["title"]!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoPath: videos[index]["path"]!,
                    title: videos[index]["title"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
