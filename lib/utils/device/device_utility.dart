import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class ADDeviceUtils {
  ADDeviceUtils._();

  static void hideKeyboard(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

  static Future<void> setStatusBarColor(Color color) async => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) => SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);

  static double getStringHeight() => MediaQuery.of(Get.context!).size.height;

  static double getStringWidth() => MediaQuery.of(Get.context!).size.width;

  static double getPixelRatio() => MediaQuery.of(Get.context!).devicePixelRatio;

  static double getStatusBarHeight() => MediaQuery.of(Get.context!).padding.top;

  static double getBottomNavigationBarHeight() => kBottomNavigationBarHeight;

  static double getAppBarHeight() => kToolbarHeight;

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboadVisible() async {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async => defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async => await SystemChrome.setPreferredOrientations(orientations);

  static void hideStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  static void showStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('fast.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static bool isIOS() => Platform.isIOS;

  static bool isAndroid() => Platform.isAndroid;
}
