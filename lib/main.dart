import 'package:ebazaar/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // Todo: Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  Firebase.initializeApp();
  
  // Todo: Initialize Authentication

  runApp(const App());
}
