import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  Future<void> loadAboutApp() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('aboutApp')) {
      setState(() {
        aboutApp = prefs.getStringList('aboutApp')!;
      });
    }
  }

  Future<void> saveAboutApp() async {
    final prefs = await SharedPreferences.getInstance();
    aboutApp.insert(0, textEditingController.text);
    prefs.setStringList('aboutApp', aboutApp);
  }

  @override
  void initState() {
    loadAboutApp();
    super.initState();
  }

  final textEditingController = TextEditingController();
  List<String> aboutApp = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            const Text(
              "Give app Feedback",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              minLines: 1,
              maxLines: 3,
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: "Give app feedback",
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  saveAboutApp();
                  setState(() {});
                }
              },
              child: const Text("Submit feedback"),
            ),
            const SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
              itemCount: aboutApp.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(
                    aboutApp[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
