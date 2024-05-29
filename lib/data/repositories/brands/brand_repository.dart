import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';
import 'package:ebazaar/features/shop/models/brand_category_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();

      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db.collection("BrandCategories").where('categoryId', isEqualTo: categoryId).get(); // collection should be BrandCategory

      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } catch (e) {
      rethrow;
    }
  }

  /// Upload Dummy Data
  Future<void> uploadDummyBrands(List<BrandModel> brands) async {
    try {
      final storage = Get.put(ADFirebaseStorageService());

      for (var brand in brands) {
        final imageData = await storage.getImageData(brand.image);

        final url = await storage.uploadImageData("Brands/Images", imageData, brand.image.toString());

        brand.image = url;

        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
    } catch (e) {
      rethrow;
    } finally {}
  }

  Future<void> uploadDummyBrandCategory(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await _db.collection("BrandCategory").add(brandCategory.toJson());
      }
    } catch (e) {
      rethrow;
    } finally {}
  }
}
