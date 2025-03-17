// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class VoiceTrialScreen extends StatefulWidget {
//   @override
//   _VoiceTrialScreenState createState() => _VoiceTrialScreenState();
// }

// class _VoiceTrialScreenState extends State<VoiceTrialScreen> {
//   stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   String _recognizedText = "Tap the mic and say a category...";

//   void _startListening() async {
//     bool available = await _speech.initialize(
//       onStatus: (status) => print("Status: $status"),
//       onError: (error) => print("Error: $error"),
//     );

//     if (available) {
//       setState(() {
//         _isListening = true;
//       });

//       _speech.listen(
//         onResult: (result) {
//           setState(() {
//             _recognizedText = result.recognizedWords;
//           });

//           _navigateBasedOnVoice(result.recognizedWords);
//         },
//       );
//     }
//   }

//   void _stopListening() {
//     _speech.stop();
//     setState(() {
//       _isListening = false;
//     });
//   }

//   void _navigateBasedOnVoice(String command) {
//     command = command.toLowerCase(); // Convert to lowercase for easy matching

//     if (command.contains("video") || command.contains("videos")) {
//       Navigator.pushNamed(context, '/videos'); // Navigate to Video Screen
//     } else if (command.contains("music") || command.contains("songs")) {
//       Navigator.pushNamed(context, '/music'); // Navigate to Music Screen
//     } else if (command.contains("articles")) {
//       Navigator.pushNamed(context, '/articles'); // Navigate to Articles Screen
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("No matching category found! Try again.")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Voice Navigation")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_recognizedText, style: TextStyle(fontSize: 18)),
//             SizedBox(height: 20),
//             FloatingActionButton(
//               onPressed: _isListening ? _stopListening : _startListening,
//               child: Icon(_isListening ? Icons.mic_off : Icons.mic),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _searchQuery = "";

  // Sample endpoints
  final List<String> endpoints = [
    "simulation",
    "videos",
    "audios",
    "articles",
    "health",
    "whatsapp"
  ];

  List<String> searchResults = [];

  // Function to start listening
  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print("Speech status: $status"),
      onError: (error) => print("Speech error: $error"),
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            _searchQuery = result.recognizedWords;
          });
          _performSearch(_searchQuery);
        },
      );
    }
  }

  // Function to stop listening
  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  // Search logic
  void _performSearch(String query) {
    setState(() {
      searchResults = endpoints
          .where((endpoint) =>
              endpoint.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Search"),
        actions: [
          IconButton(
            icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            onPressed: () {
              if (_isListening) {
                _stopListening();
              } else {
                _startListening();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Spoken Query:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(_searchQuery, style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 20),
            Text("Search Results:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: searchResults.isEmpty
                  ? Text("No results found")
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(searchResults[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
