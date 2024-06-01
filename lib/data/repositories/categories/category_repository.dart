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
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    } finally {}
  }

  /// Get Sub Categories

  /// Upload Categories to the Cloud Firestore
  Future<void> uploadDummyCategories(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(ADFirebaseStorageService());

      for (var category in categories) {
        final imageData = await storage.getImageData(category.image);

        final url = await storage.uploadImageData("Categories/Images", imageData, category.image.toString());

        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } catch (e) {
      rethrow;
    } finally {}
  }
}
