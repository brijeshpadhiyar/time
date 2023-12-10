import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    taskGet();
    super.onInit();
  }

  final titleController = Rx(TextEditingController());
  final descriptionController = Rx(TextEditingController());
  List<String> category = ["Learning", "Work", "General"].obs;
  RxString selectedCategory = 'Learning'.obs;

  final date = Rx<String>('dd/mm/yyyy');
  final time = Rx<String>('hh:mm');
  RxBool isLoding = false.obs;
  RxBool taskAssigning = false.obs;
  List tasks = [].obs;

  void taskAssign(int index) {
    taskAssigning.value = true;
    titleController.value.text = tasks[index]['title'];
    descriptionController.value.text = tasks[index]['description'];
    date.value = tasks[index]['date'];
    time.value = tasks[index]['time'];
    selectedCategory.value = tasks[index]['category'];
    taskAssigning.value = false;
  }

  Future<void> datePicker(BuildContext context) async {
    var value = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime(2025));
    if (value != null) {
      final formated = DateFormat.yMd().format(value);
      date.value = formated;
    }
  }

  Future<void> timePicker(BuildContext context) async {
    var value = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (value != null) {
      // ignore: use_build_context_synchronously
      final formated = value.format(context).toString();
      time.value = formated;
    }
  }

  Future<void> taskGet() async {
    isLoding.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? draftString = sharedPreferences.getStringList('task');

    if (draftString != null) {
      tasks = draftString.map((draftString) => jsonDecode(draftString)).toList();
    }
    isLoding.value = false;
  }

  Future<void> updateTask(int index, Map updatedTask) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String>? taskList = sharedPreferences.getStringList('task');
    if (taskList != null) {
      taskList[index] = jsonEncode(updatedTask);
      await sharedPreferences.setStringList('task', taskList);
      taskGet();
    }
  }

  Future<void> deleteTask(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? taskList = sharedPreferences.getStringList('task');

    if (taskList != null && index >= 0 && index < taskList.length) {
      taskList.removeAt(index);
      await sharedPreferences.setStringList('task', taskList);
      taskGet();
    }
  }
}
