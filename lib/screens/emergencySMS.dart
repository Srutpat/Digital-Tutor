// import 'package:flutter/material.dart';
// // import 'package:flutter_sms/flutter_sms.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SOSScreen(),
//     );
//   }
// }

// class SOSScreen extends StatefulWidget {
//   const SOSScreen({super.key});

//   @override
//   _SOSScreenState createState() => _SOSScreenState();
// }

// class _SOSScreenState extends State<SOSScreen> {
//   final String emergencyContact = "+919284146448"; // Replace with actual number

//   void sendEmergencySMS() async {
//     String message = "🚨 SOS Alert! I need immediate help. Please call me ASAP!";
//     try {
//       await sendSMS(
//         message: message,
//         recipients: [emergencyContact],
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Emergency SMS Sent! 🚨")),
//       );
//     } catch (e) {
//       print("Failed to send SMS: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("SOS Emergency")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: sendEmergencySMS,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.red,
//             padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//           ),
//           child: Text("🚨 Send SOS", style: TextStyle(fontSize: 20, color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }