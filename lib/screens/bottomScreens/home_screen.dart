import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time/controller/bottomScreensControls/home_screen_controller.dart';
import 'package:time/widgets/textfiled_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Obx(() => Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Title Task",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      CustomeTextWidget(
                        controller: controller.titleController.value,
                        maxLines: 1,
                        hintText: "Enter title",
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      CustomeTextWidget(
                        controller: controller.descriptionController.value,
                        maxLines: 5,
                        hintText: "Add Description",
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Category",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Material(
                            child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.black),
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Colors.green,
                                  title: Text(
                                    controller.category[0],
                                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  value: 0,
                                  groupValue: controller.radioGroupValue.value,
                                  onChanged: (value) {
                                    controller.radioGroupValue.value = value!;
                                  },
                                )),
                          )),
                          Expanded(
                              child: Material(
                            child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.black),
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Colors.blue,
                                  title: Text(
                                    controller.category[1],
                                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  value: 1,
                                  groupValue: controller.radioGroupValue.value,
                                  onChanged: (value) {
                                    controller.radioGroupValue.value = value!;
                                  },
                                )),
                          )),
                          Expanded(
                              child: Material(
                            child: Theme(
                                data: ThemeData(unselectedWidgetColor: Colors.black),
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Colors.amberAccent,
                                  title: Text(
                                    controller.category[2],
                                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  ),
                                  value: 2,
                                  groupValue: controller.radioGroupValue.value,
                                  onChanged: (value) {
                                    controller.radioGroupValue.value = value!;
                                  },
                                )),
                          )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => controller.datePicker(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Date", style: TextStyle(color: Colors.black, fontSize: 18)),
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
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.titleController.value.text.isNotEmpty ||
                                controller.descriptionController.value.text.isNotEmpty) {
                              controller.taskAdd().then((message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message ?? 'Note saved successfully'),
                                  ),
                                );
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(error.toString()),
                                  ),
                                );
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Note saved'),
                                ),
                              );
                            }
                          },
                          child: const Text("Add Note"),
                        ),
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
