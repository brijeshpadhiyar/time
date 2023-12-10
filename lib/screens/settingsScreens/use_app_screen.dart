import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UseAppScreen extends StatelessWidget {
  const UseAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "1. Creating Tasks:",
      "2. Managing Tasks:",
    ];
    List<String> description = [
      "Tap on the  '+'  Icon: On the main screen, tap the plus icon or the 'Add Task' button. Enter Task Details: Input the task title, description, and select a category for the task (e.g., Work, Personal, Shopping).Save: Tap to add the task to your list.",
      "Edit Task: Tap on a task to edit its details. Update the title, description, or category as needed Swipe right or tap to mark a task as completed. It moves the task to the completed tasks sectionDelete Task: Swipe left or use the delete button to remove a task from the list.",
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Use app steps"),
        ),
        body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(
                    "${title[index]} :",
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
