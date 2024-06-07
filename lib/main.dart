import 'package:ebazaar/app.dart'; // Importing the main app widget
import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:get_storage/get_storage.dart'; // Importing GetStorage for local storage
import 'package:ebazaar/firebase_options.dart'; // Importing Firebase options
import 'package:firebase_auth/firebase_auth.dart'; // Importing Firebase Authentication
import 'package:firebase_core/firebase_core.dart'; // Importing Firebase core package
import 'package:flutter_native_splash/flutter_native_splash.dart'; // Importing Flutter Native Splash for splash screen
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart'; // Importing authentication repository

/// The main entry point of the application
Future<void> main() async {
  // Ensures that widget binding is initialized before running the app
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initializing GetStorage for local storage
  await GetStorage.init();

  // Preserving the native splash screen until the app is ready
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initializing Firebase with default options for the current platform
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Putting AuthenticationRepository into GetX dependency injection
  AuthenticationRepository.instance;

  // Listening to authentication state changes
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    // Handle user state changes here
  });

  // Running the main app widget
  runApp(const App());
}
