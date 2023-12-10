import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedBackController extends GetxController {
  @override
  void onInit() {
    loadFeedback();
    super.onInit();
  }

  final textEditingController = Rx(TextEditingController());
  List feedbackList = [].obs;
  Future<void> loadFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('feedback')) {
      feedbackList = prefs.getStringList('feedback')!;
    }
  }

  Future<void> saveFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    feedbackList.insert(0, textEditingController.value.text);
    prefs.setStringList('feedback', feedbackList as List<String>);
  }
}
