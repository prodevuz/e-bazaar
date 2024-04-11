import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';
import 'package:ebazaar/features/authentication/screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variablse
  final email = TextEditingController();
  GlobalKey<FormState> forgetPassworFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog("So'rovingiz ko'rib chiqilmoqda...", ADImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        ADLoaders.warningSnackBar(title: "Oflaynsiz", message: "Internet aloqasini tekshiring.");
        return;
      }

      // Form Validation
      if (!forgetPassworFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        ADLoaders.warningSnackBar(title: "Ma'lumotlar to'g'ri to'ldirilishi shart.");
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResendEmail(email.text.trim());

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog("So'rovingiz ko'rib chiqilmoqda...", ADImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        ADLoaders.warningSnackBar(title: "Oflaynsiz", message: "Internet aloqasini tekshiring.");
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResendEmail(email);

      // Show success message
      ADLoaders.successSnackBar(title: "Email jo'natildi", message: "Pochtangizni tekshiring va emailingizni tasdiqlang.");

      // Remove Loader
      FullScreenLoader.stopLoading();
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
    }
  }
}
