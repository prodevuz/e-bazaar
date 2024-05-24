import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return webOptions;
      // } else if (Platform.isIOS || Platform.isMacOS) {
      //   return iosOptions;
    } else {
      return androidOptions;
    }
  }

  static const FirebaseOptions androidOptions = FirebaseOptions(
    apiKey: "AIzaSyAebdxonCIVAx6O7JNxA6cTTkZgVEPQZRk",
    appId: "1:753809253369:android:b0a53bede72b3706395328",
    messagingSenderId: "753809253369",
    projectId: "ghausshop",
    storageBucket: "ghausshop.appspot.com",
  );

  static const FirebaseOptions webOptions = FirebaseOptions(
    apiKey: "AIzaSyCOGTsWG9Vjsaj4RgbAnRHG6p-vVq6K-QU",
    authDomain: "ghausshop.firebaseapp.com",
    databaseURL: "https://ghausshop-default-rtdb.firebaseio.com",
    projectId: "ghausshop",
    storageBucket: "ghausshop.appspot.com",
    messagingSenderId: "753809253369",
    appId: "1:753809253369:web:25a1b376ffe5075f395328",
    measurementId: "G-317TJCMCCN",
  );
}
