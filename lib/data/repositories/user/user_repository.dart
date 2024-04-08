import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/utils/exceptions/format_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_exception.dart';
import 'package:ebazaar/utils/exceptions/platform_exception.dart';
import 'package:ebazaar/utils/exceptions/firebase_auth_exception.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    // currentUser = user;
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw "Nimadir xato ketdi. Iltimos qayta urunib ko'ring";
    }
  }

  /// Fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser!.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw ADFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ADFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ADFormatException();
    } on PlatformException catch (e) {
      throw ADPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
