import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';
import 'package:ebazaar/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  void fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "",
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? ADImages.user,
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      ADLoaders.warningSnackBar(
        title: "Ma'lumotlar saqlanmadi",
        message: "Ma'lumotlaringizni saqlashda nimadir xato ketdi. Ma'lumotlaringizni profilingizda qayta saqlashingiz mumkin.",
      );
    }
  }

  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      titlePadding: const EdgeInsets.all(ADSizes.md),
      title: "Hisobni o'chirish",
      middleText: "Hisobingizni butunlay o'chirishga ishonchingiz komilmi? Bu harakatni ortga qaytarib bo'lmaydi va hamma ma'lumotlaringiz butunlay o'chiriladi.",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: ADSizes.lg),
          child: Text("O'chirish"),
        ),
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text("Bekor qilish")),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      /// Start loading
      FullScreenLoader.openLoadingDialog("Jarayonda", ADImages.docerAnimation);

      /// First ReAuthenticate User
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      ADLoaders.warningSnackBar(title: "Ogohlantirish", message: e.toString());
    }
  }

  /// ReAuthenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog("Jarayonda", ADImages.docerAnimation);

      // Check Internte
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      ADLoaders.warningSnackBar(title: "Ogohlantirish", message: e.toString());
    }
  }
}
