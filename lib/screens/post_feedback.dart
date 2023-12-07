import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostFeedBack extends StatefulWidget {
  const PostFeedBack({super.key});

  @override
  State<PostFeedBack> createState() => _PostFeedBackState();
}

class _PostFeedBackState extends State<PostFeedBack> {
  Future<void> loadFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('feedback')) {
      setState(() {
        feedbackList = prefs.getStringList('feedback')!;
      });
    }
  }

  Future<void> saveFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    feedbackList.insert(0, textEditingController.text);
    prefs.setStringList('feedback', feedbackList);
  }

  @override
  void initState() {
    loadFeedback();
    super.initState();
  }

  final textEditingController = TextEditingController();
  List<String> feedbackList = [];

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
              "Enter Feedback",
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
                hintText: "Enter Feedback",
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  saveFeedback();
                  setState(() {});
                }
              },
              child: const Text("Submit feedback"),
            ),
            const SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(
                    feedbackList[index],
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
