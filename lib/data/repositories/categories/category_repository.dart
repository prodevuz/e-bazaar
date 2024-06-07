import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance; // Firestore instance for database operations

  /// Fetch all categories from Firestore
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get(); // Retrieve categories collection snapshot
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList(); // Map documents to CategoryModel objects
      return list; // Return list of categories
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch subcategories for a given category from Firestore
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get(); // Query subcategories with matching ParentId
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList(); // Map documents to CategoryModel objects
      return result; // Return list of subcategories
    } catch (e) {
      rethrow; // Rethrow any caught errors
    } finally {}
  }

  /// Upload dummy categories data to Firestore
  Future<void> uploadDummyCategories(List<CategoryModel> categories) async {
    try {
      final storage = ADFirebaseStorageService.instance; // Firebase Storage instance for file operations

      for (var category in categories) {
        // Get image data for each category image
        final imageData = await storage.getImageData(category.image);

        // Upload image data to Firebase Storage and get download URL
        final url = await storage.uploadImageData("Categories/Images", imageData, category.image.toString());

        category.image = url; // Update category image URL with the download URL

        await _db.collection("Categories").doc(category.id).set(category.toJson()); // Upload category data to Firestore
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    } finally {}
  }
}
