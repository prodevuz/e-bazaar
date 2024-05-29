import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ADFirebaseStorageService extends GetxController {
  static ADFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets or Image URLs from IDE
  /// Returns a Uint8List containing image date
  Future<Uint8List> getImageData(String pathOrUrl) async {
    try {
      if (pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://')) {
        // If it's a URL, fetch the image data from the web
        final response = await http.get(Uri.parse(pathOrUrl));
        if (response.statusCode == 200) {
          return response.bodyBytes;
        } else {
          throw Exception('Failed to load image from URL: ${response.statusCode}');
        }
      } else {
        // Otherwise, assume it's a local asset path and load the image data from assets
        final byteData = await rootBundle.load(pathOrUrl);
        return byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      }
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

  /// Upload image on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putData(File(image.path).readAsBytesSync());
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}
