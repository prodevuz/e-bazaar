import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    // currentUser = user;
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      rethrow;
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
    } catch (e) {
      rethrow;
    }
  }

  /// Update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } catch (e) {
      rethrow;
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser!.uid).update(json);
    } catch (e) {
      rethrow;
    }
  }

  /// Remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      rethrow;
    }
  }

  /// Remove user image from Firebase Storage
  Future<void> removeUserImage() async {
    try {
      final ref = FirebaseStorage.instance.ref("Users/Images/Profile");
      final ListResult result = await ref.listAll();
      if (result.items.isNotEmpty) {
        await result.items.first.delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
