import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';
import 'package:ebazaar/features/authentication/screens/signup/verify_email.dart';
import 'package:ebazaar/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevent Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  /* --------------------- Email & Password sign-in --------------------- */

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw "Nimadir xato ketdi. Iltimos qayta urinib ko'ring!";
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ADLoaders.warningSnackBar(title: "Internet aloqasi yo'q");
        return;
      }

      await _auth.currentUser?.sendEmailVerification();

      ADLoaders.successSnackBar(title: "Email jo'natildi", message: "Pochtangizni tekshiring va emailingizni tasdiqlang.");
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      // Hide loading indicator
      FullScreenLoader.stopLoading();

      ADLoaders.errorSnackBar(title: "Xatolik", message: e.toString());
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD

  /// [Logout user] - Valid for any autentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw "Nimadir xato ketdi. Iltimos qayta urinib ko'ring!";
    }
  }
}
