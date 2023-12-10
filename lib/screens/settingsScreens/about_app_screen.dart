import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAboutScreen extends StatelessWidget {
  const AppAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Create Tasks",
      "Categorization",
      "Task Details",
      "Easy Management",
      "ntuitive Interface",
      "Sync Across Devices",
      "Customization",
      "Reminder Alerts",
    ];
    List<String> description = [
      "Easily add tasks with titles, descriptions, and categories to keep everything organized.",
      " Group tasks by categories to streamline your workflow. From 'Work' to 'Personal' or 'Shopping' to 'Meetings,' you have the flexibility to categorize tasks as per your needs.",
      " Provide comprehensive details for each task, including due dates, priorities, and additional notes, to ensure clarity and focus.",
      " Edit, mark tasks as completed, or delete them with simple gestures to maintain an up-to-date task list.",
      " Enjoy a user-friendly interface designed for quick navigation and easy task management. Access all functionalities with just a few taps.",
      " Seamlessly sync your tasks across multiple devices to stay updated, whether you're using your smartphone, tablet, or computer.",
      " Personalize the app with themes and color schemes that suit your preferences, making your task management experience more enjoyable.",
      "Set reminders and notifications for important tasks and deadlines, ensuring you never miss a task again.",
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("About app"),
        ),
        body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1} ${title[index]} :",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description[index],
                    style: const TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
            );
          },
        ));
  }
}
