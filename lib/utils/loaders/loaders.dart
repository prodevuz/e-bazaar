import 'package:get/get.dart'; // Import the Get package for state management
import 'package:iconsax/iconsax.dart'; // Import the Iconsax icon pack
import 'package:flutter/material.dart'; // Import the Flutter material library
import 'package:ebazaar/utils/constants/colors.dart'; // Import color constants
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Import helper functions

class ADLoaders {
  // Method to hide the current snackbar
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  // Method to show a custom toast message
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HelperFunctions.isDarkMode(Get.context!) ? ADColors.darkerGrey.withOpacity(0.9) : ADColors.grey.withOpacity(0.9),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  // Method to show a success snackbar
  static successSnackBar({required title, message = '', duration = 3}) => Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: ADColors.white,
        margin: const EdgeInsets.all(10),
        backgroundColor: ADColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        icon: const Icon(Iconsax.check, color: ADColors.white),
      );

  // Method to show a warning snackbar
  static warningSnackBar({required title, message = ''}) => Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: ADColors.white,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        icon: const Icon(Iconsax.warning_2, color: ADColors.white),
      );

  // Method to show an error snackbar
  static errorSnackBar({required title, message = ''}) => Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: ADColors.white,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade600,
        icon: const Icon(Iconsax.warning_2, color: ADColors.white),
      );
}
