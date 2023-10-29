import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDarkMode();
  }

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    saveDarkMode();
  }

  Future<void> saveDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
  }

  Future<void> loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? darkMode = prefs.getBool('isDarkMode');
    if (darkMode != null) {
      isDarkMode.value = darkMode;
    }
  }
}
