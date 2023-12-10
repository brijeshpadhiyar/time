import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time/controller/bottomScreensControls/task_controller.dart';

class TaskEditScreen extends StatelessWidget {
  final List tasks;
  final int index;
  const TaskEditScreen({super.key, required this.tasks, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (controller) {
        return Obx(() => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 2,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                title: const Text(
                  "Tasks",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: controller.titleController.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Description : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: controller.descriptionController.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      DropdownButton<String>(
                        value: controller.selectedCategory.value,
                        items: controller.category.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedCategory.value = newValue;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => controller.datePicker(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Date", style: TextStyle(color: Colors.black, fontSize: 18)),
                                SizedBox(height: 8.h),
                                Container(
                                  width: 120.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [const Icon(Icons.calendar_month), Text(controller.date.value)],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.timePicker(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Time", style: TextStyle(color: Colors.black, fontSize: 18)),
                                SizedBox(height: 8.h),
                                Container(
                                  width: 90.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [const Icon(Icons.punch_clock), Text(controller.time.value)],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Back"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Map updateTask = {
                                "title": controller.titleController.value.text,
                                "description": controller.descriptionController.value.text,
                                "date": controller.date.value,
                                "time": controller.time.value,
                                "category": controller.selectedCategory.value,
                              };
                              controller.updateTask(index, updateTask);
                              Get.back();
                            },
                            child: const Text("Update"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.deleteTask(index);
                              Get.back();
                            },
                            child: const Text("Delate "),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
