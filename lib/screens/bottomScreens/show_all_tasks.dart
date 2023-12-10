import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time/controller/bottomScreensControls/task_controller.dart';
import 'package:time/screens/task_edit_screen.dart';

class ShowAllTasks extends StatefulWidget {
  const ShowAllTasks({super.key});

  @override
  State<ShowAllTasks> createState() => _ShowAllTasksState();
}

class _ShowAllTasksState extends State<ShowAllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return Obx(
            () => controller.isLoding.value
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: ListTile(
                          onTap: () {
                            controller.taskAssign(index);
                            Get.to(() => TaskEditScreen(
                                  tasks: controller.tasks,
                                  index: index,
                                ));
                          },
                          leading: const Icon(Icons.title_sharp),
                          tileColor: controller.tasks[index]['category'] == 'Work'
                              ? Colors.blue.shade300
                              : controller.tasks[index]['category'] == 'General'
                                  ? Colors.amber.shade300
                                  : controller.tasks[index]['category'] == 'Learning'
                                      ? Colors.green.shade300
                                      : null,
                          title: Text(
                            controller.tasks[index]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
