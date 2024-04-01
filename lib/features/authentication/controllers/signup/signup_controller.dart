import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
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
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy & Policy
      if (!privacyPolicy.value) {
        ADLoaders.warningSnackBar(title: "Foydalanish shartlari qabul qilinmadi", message: "Hisob yaratish uchun foydalanish shartlarini qabul qiling");
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

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show success message
      ADLoaders.successSnackBar(title: "Tabriklaymiz", message: "Hisobingiz yaratildi! Davom etish uchun emailni tasdiqlang.");

      // Remove loader
      FullScreenLoader.stopLoading();

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Show some Generic error to the user
      ADLoaders.errorSnackBar(title: "Xato", message: e.toString());
    }
  }
}
