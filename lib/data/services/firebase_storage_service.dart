import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ADFirebaseStorageService extends GetxController {
  static ADFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE
  /// Returns a Uint8List containing image date
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      rethrow;
    }
  }

  /// Upload image using ImageData on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
