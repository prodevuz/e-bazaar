import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';

/// A class to handle and display various types of exceptions
class ADException {
  late String message;
  String code = '';

  /// Constructor to initialize ADException with the appropriate message based on the type of exception
  ADException(exception) {
    if (exception is FirebaseAuthException) {
      // Handle FirebaseAuthException
      code = exception.code;
      message = ADFirebaseAuthException(exception.code).message;
    } else if (exception is FirebaseException) {
      // Handle FirebaseException
      code = exception.code;
      message = ADFirebaseException(exception.code).message;
    } else if (exception is FormatException) {
      // Handle FormatException
      message = ADFormatException().message;
    } else if (exception is PlatformException) {
      // Handle PlatformException
      code = exception.code;
      message = ADPlatformException(exception.code).message;
    } else {
      // Handle generic exceptions
      message = exception.toString();
    }

    // Log the exception message and code in debug mode
    if (kDebugMode) log(message + code);

    // Show an error snackbar with the exception message
    ADLoaders.errorSnackBar(title: "Xato", message: message);
  }
}
