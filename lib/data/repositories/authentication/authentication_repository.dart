import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ebazaar/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevent Screen
  screenRedirect() async {
    /// Local Storage
    deviceStorage.writeIfNull("IsFirstTime", true);
    deviceStorage.read("IsFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  /* --------------------- Email & Password sign-in --------------------- */

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - MAIL VERIFICATION

  /// [EmailAuthentication] - FORGET PASSWORD
}
