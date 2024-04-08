import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:ebazaar/navigation_menu.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/logging/logger.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/utils/popups/full_screen_loader.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
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

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      await UserRepository.instance.loadUserData(userCredential.user!.uid);
      ADLoaders.successSnackBar(title: "Tabriklaymiz", message: "Hisobga muvaffaqiyatli kirildi.");
      return userCredential;
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
  Future<void> sendPasswordResendEmail(String email) async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ADLoaders.warningSnackBar(title: "Internet aloqasi yo'q");
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);

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
  /// [ReAuthenticate] - REAUTHENTICATE

  /// [GoogleAuthentification] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        LoggerHelper.error(e.toString());
      }
      return null;
    }
  }

  /// [FacebookAuthentification] - FACEBOOK

  /// [LogoutUser] - LOGOUT
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
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
