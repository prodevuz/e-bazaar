import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Sub Categories

  /// Upload Categories to the Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(ADFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get image data link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to category.image attribute
        category.image = url;

        // Store category in Firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}
