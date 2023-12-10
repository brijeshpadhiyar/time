import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time/controller/main_home_controller.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeScreenController>(
        init: MainHomeScreenController(),
        builder: (controller) {
          return Obx(
            () => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  controller.title[controller.currentIndex.value],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
              ),
              body: controller.bottomScreens[controller.currentIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  currentIndex: controller.currentIndex.value,
                  onTap: (value) {
                    controller.currentIndex.value = value;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.notes,
                        ),
                        label: 'All Notes'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                        ),
                        label: 'Settings'),
                  ]),
            ),
          );
        });
  }
}
