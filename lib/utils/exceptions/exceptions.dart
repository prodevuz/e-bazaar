import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';

class ADException {
  late String message;
  String code = '';
  ADException(exception) {
    if (exception is FirebaseAuthException) {
      code = exception.code;
      message = ADFirebaseAuthException(exception.code).message;
    } else if (exception is FirebaseException) {
      code = exception.code;
      message = ADFirebaseException(exception.code).message;
    } else if (exception is FormatException) {
      message = ADFormatException().message;
    } else if (exception is PlatformException) {
      code = exception.code;
      message = ADPlatformException(exception.code).message;
    } else {
      message = "Noma'lum xatolik yuz berdi.";
    }
    if (kDebugMode) log(message + code);
    ADLoaders.errorSnackBar(title: "Xato", message: message);
  }
}
