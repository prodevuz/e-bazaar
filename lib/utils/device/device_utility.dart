import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class ADDeviceUtils {
  // Private constructor to prevent instantiation
  ADDeviceUtils._();

  /// Checks if the device is running iOS
  static bool isIOS() => Platform.isIOS;

  /// Checks if the device is running Android
  static bool isAndroid() => Platform.isAndroid;

  /// Gets the default height of the app bar
  static double getAppBarHeight() => kToolbarHeight;

  /// Gets the width of the screen
  static double getStringWidth() => MediaQuery.of(Get.context!).size.width;

  /// Gets the height of the screen
  static double getStringHeight() => MediaQuery.of(Get.context!).size.height;

  /// Gets the default height of the bottom navigation bar
  static double getBottomNavigationBarHeight() => kBottomNavigationBarHeight;

  /// Gets the pixel ratio of the device
  static double getPixelRatio() => MediaQuery.of(Get.context!).devicePixelRatio;

  /// Gets the height of the status bar
  static double getStatusBarHeight() => MediaQuery.of(Get.context!).padding.top;

  /// Gets the height of the keyboard
  static double getKeyboardHeight() => MediaQuery.of(Get.context!).viewInsets.bottom;

  /// Checks if the keyboard is visible
  static Future<bool> isKeyboadVisible() async => MediaQuery.of(Get.context!).viewInsets.bottom > 0;

  /// Hides the keyboard by unfocusing any focused node
  static void hideKeyboard(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

  /// Checks if the device is in portrait orientation
  static bool isPortraitOrientation(BuildContext context) => View.of(context).viewInsets.bottom != 0;

  /// Checks if the device is in landscape orientation
  static bool isLandscapeOrientation(BuildContext context) => View.of(context).viewInsets.bottom == 0;

  /// Hides the status bar
  static void hideStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  /// Shows the status bar
  static void showStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  /// Sets the status bar color
  static Future<void> setStatusBarColor(Color color) async => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));

  /// Enables or disables full screen mode
  static void setFullScreen(bool enable) => SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);

  /// Checks if the app is running on a physical device
  static Future<bool> isPhysicalDevice() async => defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;

  /// Sets the preferred device orientations
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async => await SystemChrome.setPreferredOrientations(orientations);

  /// Vibrates the device for a specified duration
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Checks if the device has an active internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('fast.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
