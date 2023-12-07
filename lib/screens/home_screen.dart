import 'package:flutter/material.dart';
import 'package:time/drawer_list.dart';
import 'package:time/screens/about_app_screen.dart';
import 'package:time/screens/add_new_note.dart';
import 'package:time/screens/post_feedback.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: 350,
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'TimeBlend WeightSync',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            customeListTile("About App", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutApp(),
                  ));
            }),
            customeListTile("New Note", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNewNote(),
                  ));
            }),
            customeListTile("How to use app", () {}),
            customeListTile("Post Feedback", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostFeedBack(),
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
