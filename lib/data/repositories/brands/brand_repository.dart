import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:ebazaar/utils/logging/logger.dart';
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
      if (kDebugMode) LoggerHelper.debug("Getting BrandCategory with categoryId");
      QuerySnapshot brandCategoryQuery = await _db.collection("BrandCategory").where('categoryId', isEqualTo: categoryId).get();
      if (kDebugMode) LoggerHelper.debug("Assigned!");

      if (kDebugMode) LoggerHelper.debug("Assigning brandIds");
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      if (kDebugMode) LoggerHelper.debug(brandIds.toString());
      if (kDebugMode) LoggerHelper.debug("Assigned!");

      if (kDebugMode) LoggerHelper.debug("Assigning brandsQuery with brandIds");
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      if (kDebugMode) LoggerHelper.debug("Fetched brands into query with brandIds!");

      if (kDebugMode) LoggerHelper.debug("Assigning brands");
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      if (kDebugMode) LoggerHelper.debug("Successful! | Completed work of getBrandsForCategory!");

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

  Future<void> uploadDummyBrandCategories(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await _db.collection("BrandCategories").add(brandCategory.toJson());
      }
    } catch (e) {
      rethrow;
    } finally {}
  }
}
