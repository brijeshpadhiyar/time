import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowAllNotes extends StatefulWidget {
  const ShowAllNotes({super.key});

  @override
  State<ShowAllNotes> createState() => _ShowAllNotesState();
}

class _ShowAllNotesState extends State<ShowAllNotes> {
  List notes = [];

  Future<void> loadNotes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? draftString = sharedPreferences.getStringList('notes');

    if (draftString != null) {
      setState(() {
        notes = draftString.map((draftString) => jsonDecode(draftString)).toList();
      });
    }
  }

  @override
  void initState() {
    loadNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      notes[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      notes[index]['address'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      notes[index]['description'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
