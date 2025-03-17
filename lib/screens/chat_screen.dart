import 'package:digital_tutor_/screens/call_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({
          "text": _controller.text,
          "status": "sent", // Sent status (✔)
          "timestamp": TimeOfDay.now().format(context),
        });
        _controller.clear();
      });

      // Simulate message delivery (✔✔) after 1 second
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.last["status"] = "delivered"; // Delivered status (✔✔)
        });
      });

      // Simulate read status (✔✔ in blue) after 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          messages.last["status"] = "read"; // Read status (blue ✔✔)
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text("Aai", style: TextStyle(fontSize: 18,color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam, color: Colors.white,), onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(callType: "video"),
        ),
      );
    },
  ),
  IconButton(
    icon: Icon(Icons.call, color: Colors.white),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(callType: "audio"),
        ),
      );
          }),
          IconButton(icon: Icon(Icons.call,color: Colors.white,), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert,color: Colors.white,), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFDCF8C6), // WhatsApp green bubble color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(messages[index]["text"], style: TextStyle(fontSize: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              messages[index]["timestamp"],
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              messages[index]["status"] == "sent"
                                  ? Icons.check
                                  : messages[index]["status"] == "delivered"
                                      ? Icons.done_all
                                      : Icons.done_all,
                              size: 16,
                              color: messages[index]["status"] == "read"
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: Color(0xFF25D366),
                  onPressed: sendMessage,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
