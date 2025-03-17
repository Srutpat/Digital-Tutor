import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_tutor_/provider/locale_provider.dart';
import 'package:digital_tutor_/screens/home_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text("Select Language"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose Your Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _languageButton("English", "en", context, Icons.language),
            _languageButton("हिन्दी", "hi", context, Icons.translate),
            _languageButton("मराठी", "mr", context, Icons.language_outlined),
          ],
        ),
      ),
    );
  }

  Widget _languageButton(String text, String languageCode, BuildContext context, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        onTap: () {
          Locale selectedLocale = Locale(languageCode);

          // Set the selected locale BEFORE navigating
          Provider.of<LocaleProvider>(context, listen: false).setLocale(selectedLocale);

          // Navigate to HomeScreen with the updated language
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                onLanguageChange: (Locale newLocale) {
                  Provider.of<LocaleProvider>(context, listen: false).setLocale(newLocale);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
