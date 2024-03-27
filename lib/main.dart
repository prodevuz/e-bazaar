import 'package:get/get.dart';
import 'package:ebazaar/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ebazaar/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions().androidOptions,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  /// Todo: Initialize Authentication
  FirebaseAuth.instance.authStateChanges().listen((User? user) {});

  runApp(const App());
}
