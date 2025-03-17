import 'dart:async';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String callType; // "audio" or "video"

  const CallScreen({super.key, required this.callType});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int callDuration = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        callDuration++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    bool isVideoCall = widget.callType == "video";

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          isVideoCall ? "Video Call" : "Audio Call",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isVideoCall
                ? CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[700],
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  )
                : Icon(Icons.call, size: 80, color: Colors.greenAccent),
            SizedBox(height: 10),
            Text(
              "Aai",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 5),
            Text(
              formatDuration(callDuration), // Call duration
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  onPressed: () {},
                  child: Icon(Icons.mic_off, color: Colors.white),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    timer.cancel();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.call_end, color: Colors.white),
                ),
                isVideoCall
                    ? FloatingActionButton(
                        backgroundColor: Colors.grey[800],
                        onPressed: () {},
                        child: Icon(Icons.videocam_off, color: Colors.white),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
