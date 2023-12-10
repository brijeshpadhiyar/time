import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  final titleController = Rx(TextEditingController());
  final descriptionController = Rx(TextEditingController());

  final radioGroupValue = Rx<int>(0);

  final date = Rx<String>('dd/mm/yyyy');
  final time = Rx<String>('hh:mm');

  List<String> category = ["Learning", "Work", "General"].obs;

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

  Future<String?> taskAdd() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? notes = prefs.getStringList('task') ?? [];

      Map<String, dynamic> newNote = {
        'title': titleController.value.text,
        'description': descriptionController.value.text,
        'category': category[radioGroupValue.value],
        'date': date.value,
        'time': time.value,
      };

      notes.insert(0, jsonEncode(newNote));

      prefs.setStringList('task', notes);
      return "Saved";
    } catch (e) {
      return e.toString();
    }
  }
}
