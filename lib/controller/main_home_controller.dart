import 'package:get/get.dart';
import 'package:time/screens/bottomScreens/home_screen.dart';
import 'package:time/screens/bottomScreens/settings_screens.dart';
import 'package:time/screens/bottomScreens/show_all_tasks.dart';

class MainHomeScreenController extends GetxController {
  final currentIndex = Rx<int>(0);
  List bottomScreens = [
    const HomeScreen(),
    const ShowAllTasks(),
    const SettingScreens(),
  ];

  List<String> title = [
    "New Task TODO",
    "All Task",
    "Setting",
  ];
}
