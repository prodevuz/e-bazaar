import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/logging/logger.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  BrandCategoryModel copyWith({String? brandId, String? categoryId}) {
    LoggerHelper.info("Called BrandCategoryModel.copyWith()");
    return BrandCategoryModel(
      brandId: brandId ?? this.brandId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toJson() => {
        'brandId': brandId,
        'categoryId': categoryId,
      };

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(brandId: data['brandId'] as String, categoryId: data['categoryId'] as String);
  }
}
