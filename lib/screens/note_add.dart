import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final discController = TextEditingController();

  Future<String?> saveNote() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? notes = prefs.getStringList('notes') ?? [];

      Map<String, dynamic> newNote = {
        'title': titleController.text,
        'address': addressController.text,
        'description': discController.text,
      };

      notes.add(jsonEncode(newNote));

      prefs.setStringList('notes', notes);
      return "Saved";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: "Address",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: discController,
              decoration: const InputDecoration(
                hintText: "Discripation",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty ||
                    addressController.text.isNotEmpty ||
                    discController.text.isNotEmpty) {
                  saveNote().then((message) {
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
                }
              },
              child: const Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}
