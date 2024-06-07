import 'package:get/get.dart';
import 'package:ebazaar/data/models/dummy_data.dart';
import 'package:ebazaar/data/repositories/brands/brand_repository.dart';
import 'package:ebazaar/data/repositories/banners/banner_repository.dart';
import 'package:ebazaar/data/repositories/product/product_repository.dart';
import 'package:ebazaar/data/repositories/categories/category_repository.dart';

class ADDummyUpload extends GetxController {
  static ADDummyUpload get instance => Get.find();

  /// Uploads dummy data to respective repositories based on specified flags.
  Future<void> uploadDummyData({
    bool banners = true,
    bool brands = true,
    bool brandCategories = true,
    bool categories = true,
    bool products = true,
    bool productCategories = true,
  }) async {
    // Upload dummy banners if specified
    if (banners) await BannerRepository.instance.uploadDummyBanners(ADDummyData.banners);

    // Upload dummy brands and brand categories if specified
    if (brands) await BrandRepository.instance.uploadDummyBrands(ADDummyData.brands);
    if (brandCategories) await BrandRepository.instance.uploadDummyBrandCategory(ADDummyData.brandCategories);

    // Upload dummy categories if specified
    if (categories) await CategoryRepository.instance.uploadDummyCategories(ADDummyData.categories);

    // Upload dummy products and product categories if specified
    if (products) await ProductRepository.instance.uploadDummyProducts(ADDummyData.products);
    if (productCategories) await ProductRepository.instance.uploadDummyProductCategory(ADDummyData.productCategories);
  }
}
