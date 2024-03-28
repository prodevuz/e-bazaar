import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';

class ThemeModeController extends GetxController {
  static ThemeModeController get instance => Get.find();

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  Rx<bool> boolValue = false.obs;
  final dark = HelperFunctions.isDarkMode;

  void changeThemeMode(BuildContext context) {
    boolValue.value ? boolValue.value = false : boolValue.value = true;
    dark(context) ? themeMode.value = ThemeMode.light : themeMode.value = ThemeMode.dark;
  }
}
