import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ebazaar/data/models/user/user_model.dart';
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance; // Firestore instance for database operations

  /// Save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson()); // Set user data in Firestore
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get(); // Get user document by user ID
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot); // Return user model from snapshot
      } else {
        return UserModel.empty(); // Return empty user model if document does not exist
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson()); // Update user data in Firestore
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser!.uid).update(json); // Update specific field in user document
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete(); // Delete user document from Firestore
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Remove user image from Firebase Storage
  Future<void> removeUserImage() async {
    try {
      final ref = FirebaseStorage.instance.ref("Users/Images/Profile"); // Reference to user profile images
      final ListResult result = await ref.listAll(); // List all images in the directory
      if (result.items.isNotEmpty) {
        await result.items.first.delete(); // Delete the first image found
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Upload any image to Firebase Storage
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name); // Reference to storage location
      await ref.putFile(File(image.path)); // Upload image file to storage
      final url = await ref.getDownloadURL(); // Get download URL for uploaded image
      return url; // Return download URL
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }
}
