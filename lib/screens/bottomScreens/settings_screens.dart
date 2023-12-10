import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time/screens/settingsScreens/about_app_screen.dart';
import 'package:time/screens/settingsScreens/feedback_screen.dart';
import 'package:time/screens/settingsScreens/use_app_screen.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({super.key});

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListTile(
            onTap: () {
              Get.to(() => const AppAboutScreen());
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey.shade500,
            title: const Text('About App'),
            trailing: const Icon(
              Icons.arrow_right_rounded,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListTile(
            onTap: () {
              Get.to(() => const UseAppScreen());
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey.shade500,
            title: const Text('How To use app'),
            trailing: const Icon(
              Icons.arrow_right_rounded,
              size: 60,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListTile(
            onTap: () {
              Get.to(() => const FeedBackScreen());
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey.shade500,
            title: const Text('Feedback'),
            trailing: const Icon(
              Icons.arrow_right_rounded,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}
