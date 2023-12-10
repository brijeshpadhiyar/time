import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time/controller/settingScreens/feedback_controller.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedBackController>(
        init: FeedBackController(),
        builder: (controller) {
          return Obx(() => Scaffold(
                appBar: AppBar(
                  title: const Text("FeedBack"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 2,
                        minLines: 1,
                        controller: controller.textEditingController.value,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Enter FeedBack",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.textEditingController.value.text.isNotEmpty) {
                            controller.saveFeedback();
                            setState(() {});
                          }
                        },
                        child: const Text("Submit Feedback"),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.feedbackList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text("${index + 1}"),
                              title: Text(
                                controller.feedbackList[index],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
