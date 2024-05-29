import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/logging/logger.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  ProductCategoryModel copyWith({String? productId, String? categoryId}) {
    LoggerHelper.info("Called ProductCategoryModel.copyWith()");
    return ProductCategoryModel(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'categoryId': categoryId,
      };

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(productId: data['productId'] as String, categoryId: data['categoryId'] as String);
  }
}
