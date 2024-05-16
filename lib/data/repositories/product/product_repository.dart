import 'package:get/get.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(ADFirebaseStorageService());

      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        final url = await storage.uploadImageData("Products/Images", thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData("Products/Images", assetImage, image);

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            final url = await storage.uploadImageData("Products/Images", assetImage, variation.image);

            variation.image = url;
          }
        }

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } catch (e) {
      rethrow;
    } finally {}
  }
}
