import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

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
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      ADLoaders.warningSnackBar(title: "Ma'lumotlar saqlanmadi", message: "Ma'lumotlaringizni saqlashda nimadir xato ketdi. Ma'lumotlaringizni profilingizda qayta saqlashingiz mumkin.");
    }
  }
}
