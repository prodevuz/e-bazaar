import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';
import 'package:ebazaar/features/shop/models/brand_category_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance; // Firestore instance for database operations

  /// Fetch all brands from Firestore
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get(); // Retrieve brands collection snapshot
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList(); // Map documents to BrandModel objects
      return result; // Return list of brands
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch brands associated with a specific category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query brand categories collection to get brand IDs for the given category
      QuerySnapshot brandCategoryQuery = await _db.collection("BrandCategories").where('categoryId', isEqualTo: categoryId).get();
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      // Query brands collection using the retrieved brand IDs
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList(); // Map documents to BrandModel objects
      return brands; // Return list of brands
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Upload dummy brands data to Firestore
  Future<void> uploadDummyBrands(List<BrandModel> brands) async {
    try {
      final storage = ADFirebaseStorageService.instance; // Firebase Storage instance for file operations

      for (var brand in brands) {
        final imageData = await storage.getImageData(brand.image); // Get image data for each brand image
        final url = await storage.uploadImageData("Brands/Images", imageData, brand.image.toString()); // Upload image data to Firebase Storage and get download URL
        brand.image = url; // Update brand image URL with the download URL
        await _db.collection("Brands").doc(brand.id).set(brand.toJson()); // Upload brand data to Firestore
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Upload dummy brand categories data to Firestore
  Future<void> uploadDummyBrandCategory(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await _db.collection("BrandCategory").add(brandCategory.toJson()); // Upload brand category data to Firestore
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }
}
