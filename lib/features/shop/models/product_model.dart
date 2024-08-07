import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/features/shop/models/product_attribute_model.dart';
import 'package:ebazaar/features/shop/models/product_variation_model.dart';
import 'package:ebazaar/utils/logging/logger.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0.0, thumbnail: '', productType: '');

  ProductModel copyWith({
    String? id,
    String? title,
    int? stock,
    double? price,
    bool? isFeatured,
    String? thumbnail,
    String? description,
    BrandModel? brand,
    List<String>? images,
    double? salePrice,
    String? sku,
    String? categoryId,
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
    String? productType,
  }) {
    LoggerHelper.info("Called ProductModel.copyWith()");
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      isFeatured: isFeatured ?? this.isFeatured,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      images: images ?? this.images,
      salePrice: salePrice ?? this.salePrice,
      sku: sku ?? this.sku,
      categoryId: categoryId ?? this.categoryId,
      productAttributes: productAttributes ?? this.productAttributes,
      productVariations: productVariations ?? this.productVariations,
      productType: productType ?? this.productType,
    );
  }

  Map<String, dynamic> toJson() => {
        'SKU': sku,
        'Title': title,
        'Stock': stock,
        'Price': price,
        'Images': images ?? [],
        'Thumbnail': thumbnail,
        'SalePrice': salePrice,
        'IsFeatured': isFeatured,
        'CategoryId': categoryId,
        'Brand': brand!.toJson(),
        'Description': description,
        'ProductType': productType,
        'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
        'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
      };

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand'] ?? ''),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
