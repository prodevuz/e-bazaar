import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  final userController = UserController.instance;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// Email and Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Hisobingizga kirilmoqda", ADImages.docerAnimation);

      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Remember Data
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Load User Data
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Move to Home Page
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      ADLoaders.errorSnackBar(title: "Xato", message: e.toString());
    }
  }

  /// Google Sign In
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Hisobingizga kirilmoqda", ADImages.docerAnimation);

      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Move to Home Page
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      ADLoaders.errorSnackBar(title: "Xato", message: e.toString());
    }
  }
}
