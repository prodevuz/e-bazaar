import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// A helper class containing utility functions for managing various UI and data formatting tasks.
class HelperFunctions {
  HelperFunctions._();

  static ThemeMode themeMode = ThemeMode.system;

  /// Returns a [Color] based on the input string [value].
  static Color? getColor(String value) {
    final colorMap = {
      'Green': Colors.green,
      'Red': Colors.red,
      'Blue': Colors.blue,
      'Pink': Colors.pink,
      'Grey': Colors.grey,
      'Purple': Colors.purple,
      'Black': Colors.black,
      'White': Colors.white,
      'Brown': Colors.brown,
      'Teal': Colors.teal,
      'Indigo': Colors.indigo,
    };

    return colorMap[value];
  }

  /// Shows a snack bar with the given [message].
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Shows an alert dialog with the given [title] and [message].
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Navigates to the given [screen].
  static void navigateToString(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  /// Truncates the given [text] to the specified [maxLength], adding '...' if needed.
  static String truncateText(String text, int maxLength) {
    return text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';
  }

  /// Checks if the current theme is dark mode.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Returns the size of the screen.
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Returns the height of the screen.
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Returns the width of the screen. Optionally, a specific [context] can be provided.
  static double screenWidth({BuildContext? context}) {
    return MediaQuery.of(context ?? Get.context!).size.width;
  }

  /// Returns the formatted date string for the given [date] using the specified [format].
  static String getFormattedDate(DateTime date, {String format = 'dd-MMM-yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Removes duplicates from the given list [list].
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wraps a list of [widgets] into rows of a specified [rowSize].
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
