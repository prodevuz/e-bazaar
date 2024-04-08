import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
import 'package:ebazaar/features/personalization/screens/profile/profile.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User Record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Ma'lumotlaringiz yangilanmoqda...", ADImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in the Firebase Firestore
      Map<String, dynamic> name = {"FirstName": firstName.text.trim(), "LastName": lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      ADLoaders.successSnackBar(title: "Tabriklaymiz!", message: "Ismingiz yangilandi.");

      // Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      ADLoaders.errorSnackBar(title: "Xatolik", message: e.toString());
    }
  }
}
