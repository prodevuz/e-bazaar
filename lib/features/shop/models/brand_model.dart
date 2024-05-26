import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '', isFeatured: false, productsCount: 0);

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Image': image,
        'ProductsCount': productsCount,
        'IsFeatured': isFeatured,
      };

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return BrandModel.empty();

    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? 0,
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? '',
      );
    } else {
      return BrandModel.empty();
    }
  }
}
