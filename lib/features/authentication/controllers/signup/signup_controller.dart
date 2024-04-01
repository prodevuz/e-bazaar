import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';
import 'package:ebazaar/features/authentication/screens/signup/verify_email.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  void signup() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Ma'lumotlaringiz qayta ishlanmoqda...", ADImages.docerAnimation);

      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy & Policy
      if (!privacyPolicy.value) {
        ADLoaders.warningSnackBar(title: "Foydalanish shartlari qabul qilinmadi", message: "Hisob yaratish uchun foydalanish shartlarini qabul qiling");
        FullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = UserRepository.instance;
      await userRepository.saveUserRecord(newUser);

      // Show success message
      ADLoaders.successSnackBar(title: "Tabriklaymiz", message: "Hisobingiz yaratildi! Davom etish uchun emailni tasdiqlang.");

      // Remove loader
      FullScreenLoader.stopLoading();

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
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
}
