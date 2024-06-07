import 'package:get/get.dart'; // Importing GetX package for state management
import 'package:ebazaar/navigation_menu.dart'; // Importing navigation menu
import 'package:get_storage/get_storage.dart'; // Importing GetStorage for local storage
import 'package:firebase_auth/firebase_auth.dart'; // Importing Firebase Authentication
import 'package:ebazaar/utils/loaders/loaders.dart'; // Importing loaders
import 'package:google_sign_in/google_sign_in.dart'; // Importing Google Sign-In
import 'package:ebazaar/utils/helpers/network_manager.dart'; // Importing network manager
import 'package:ebazaar/utils/popups/full_screen_loader.dart'; // Importing full-screen loader
import 'package:flutter_native_splash/flutter_native_splash.dart'; // Importing Flutter Native Splash
import 'package:ebazaar/utils/local_storage/storage_utility.dart'; // Importing local storage utilities
import 'package:ebazaar/data/repositories/user/user_repository.dart'; // Importing user repository
import 'package:ebazaar/features/authentication/screens/login/login.dart'; // Importing login screen
import 'package:ebazaar/features/authentication/screens/signup/verify_email.dart'; // Importing verify email screen
import 'package:ebazaar/features/authentication/screens/onboarding/onboarding.dart'; // Importing onboarding screen

/// Authentication repository
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage(); // Local storage instance
  final _auth = FirebaseAuth.instance; // Firebase authentication instance

  // Get authenticated user data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await LocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnboardingScreen());
    }
  }

  /// [Email & Password sign-in]
  /// Log in with email and password
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      ADLoaders.successSnackBar(title: "Success", message: "Successfully logged in.");
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  /// [Email Authentication] - REGISTER
  /// Register with email and password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  /// Send email verification
  Future<void> sendEmailVerification() async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ADLoaders.warningSnackBar(title: "No internet", message: "Internet connection required.");
        return;
      }
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      FullScreenLoader.stopLoading();
      rethrow;
    }
  }

  /// [Email Authentication] - FORGET PASSWORD
  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ADLoaders.warningSnackBar(title: "No internet", message: "Internet connection required.");
        return;
      }
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  /// [ReAuthenticate] - REAUTHENTICATE
  /// Reauthenticate with email and password
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  /// [GoogleAuthentication] - GOOGLE
  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } catch (e) {
      rethrow;
    }
  }

  /// [FacebookAuthentication] - FACEBOOK

  /// [LogoutUser] - LOGOUT
  /// Log out
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      rethrow;
    }
  }

  /// [DeleteAccount] - DELETE
  /// Delete user account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      rethrow;
    }
  }
}
