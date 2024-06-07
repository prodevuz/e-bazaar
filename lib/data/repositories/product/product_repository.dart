import 'package:get/get.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/data/services/firebase_storage_service.dart';
import 'package:ebazaar/features/shop/models/product_category_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance; // Firestore instance for database operations

  /// Fetch featured products from Firestore
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(4).get(); // Query featured products with limit
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList(); // Map documents to ProductModel objects
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch all featured products from Firestore
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).get(); // Query all featured products
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList(); // Map documents to ProductModel objects
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch products based on a Firestore query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get(); // Execute query
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList(); // Map documents to ProductModel objects
      return productList; // Return list of products
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch favorite products from Firestore
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get(); // Query products by document IDs
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList(); // Map documents to ProductModel objects
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch products for a specific brand from Firestore
  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = 4}) async {
    try {
      final productsQuery = limit != -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get()
          : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get(); // Query products by brand ID with optional limit
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList(); // Map documents to ProductModel objects
      return products; // Return list of products
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Fetch products for a specific category from Firestore
  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery = limit != -1
          ? await _db.collection("ProductCategories").where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection("ProductCategories").where('categoryId', isEqualTo: categoryId).limit(limit).get(); // Query product categories by category ID with optional limit

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList(); // Extract product IDs from query snapshot

      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).limit(2).get(); // Query products by document IDs with limit

      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList(); // Map documents to ProductModel objects

      return products; // Return list of products
    } catch (e) {
      rethrow; // Rethrow any caught errors
    }
  }

  /// Upload dummy product data to Firestore
  Future<void> uploadDummyProducts(List<ProductModel> products) async {
    try {
      final storage = ADFirebaseStorageService.instance; // Firebase Storage instance for file operations

      for (var product in products) {
        final thumbnail = await storage.getImageData(product.thumbnail); // Get thumbnail image data

        final url = await storage.uploadImageData("Products/Images", thumbnail, product.thumbnail.toString()); // Upload thumbnail image to Firebase Storage and get download URL

        product.thumbnail = url; // Update product thumbnail URL with the download URL

        if (product.images != null && product.images!.isNotEmpty) {
          // Upload additional images if available
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageData(image);
            final url = await storage.uploadImageData("Products/Images", assetImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          // Upload variation images if available
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageData(variation.image);
            final url = await storage.uploadImageData("Products/Images", assetImage, variation.image);
            variation.image = url;
          }
        }
        await _db.collection("Products").doc(product.id).set(product.toJson()); // Upload product data to Firestore
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    } finally {}
  }

  /// Upload dummy product category data to Firestore
  Future<void> uploadDummyProductCategory(List<ProductCategoryModel> productCategories) async {
    try {
      for (var productCategory in productCategories) {
        await _db.collection("ProductCategory").add(productCategory.toJson()); // Upload product category data to Firestore
      }
    } catch (e) {
      rethrow; // Rethrow any caught errors
    } finally {}
  }
}
