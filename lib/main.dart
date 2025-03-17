// import 'package:digital_tutor_/screens/call_screen.dart';
// import 'package:digital_tutor_/screens/videoScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:digital_tutor_/provider/locale_provider.dart';
// import 'package:digital_tutor_/screens/chat_screen.dart';
// import 'package:digital_tutor_/screens/voice_trial.dart'; // Import the new screen
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:digital_tutor_/l10n/app_localization.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => LocaleProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final localeProvider = Provider.of<LocaleProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Digital Tutor',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       locale: localeProvider.locale,
//       supportedLocales: [
//         Locale('en', ''),
//         Locale('hi', ''),
//         Locale('mr', ''),
//       ],
//       localizationsDelegates: [
//         AppLocalization.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: HomeScreen(), // Change the home to a custom screen with navigation
//       routes: {
//         '/chat': (context) => ChatApp(),
//     // '/voice': (context) => VoiceTrialScreen(),
//     '/video call': (context) => CallScreen(callType: "video"),  // Define the VideoScreen
//     '/simulation': (context) => ChatApp()// Define the MusicScreen
//     , // Define the route for navigation
//       },
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home Page")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/chat'); // Navigate to ChatApp
//               },
//               child: Text("Go to Chat Screen"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(
//                     context, '/voice'); // Navigate to VoiceTrialScreen
//               },
//               child: Text("Go to Voice Trial"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:digital_tutor_/screens/call_screen.dart';
// import 'package:digital_tutor_/screens/home_screen.dart';
import 'package:digital_tutor_/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_tutor_/provider/locale_provider.dart';
// import 'package:digital_tutor_/screens/chat_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:digital_tutor_/l10n/app_localization.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Tutor',
      theme: ThemeData(primarySwatch: Colors.blue),
      locale: localeProvider.locale,
      supportedLocales: [
        Locale('en', ''),
        Locale('hi', ''),
        Locale('mr', ''),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SplashScreen(),
      // routes: {
      //   '/home': (context) => HomeScreen(),
      //   '/chat': (context) => ChatApp(),
      //   '/video call': (context) => CallScreen(callType: "video"),
      //   '/simulation': (context) => ChatApp(),
      // },
    );
  }
}
