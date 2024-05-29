import 'package:get/get.dart';
import 'package:ebazaar/data/models/dummy_data.dart';
import 'package:ebazaar/data/repositories/brands/brand_repository.dart';
import 'package:ebazaar/data/repositories/banners/banner_repository.dart';
import 'package:ebazaar/data/repositories/product/product_repository.dart';
import 'package:ebazaar/data/repositories/categories/category_repository.dart';

class ADDummyUpload extends GetxController {
  static ADDummyUpload get instance => Get.find();

  Future<void> uploadDummyData({
    bool banners = true,
    bool brands = true,
    bool brandCategories = true,
    bool categories = true,
    bool products = true,
    bool productCategories = true,
  }) async {
    if (banners) BannerRepository().uploadDummyBanners(ADDummyData.banners);

    if (brands) BrandRepository().uploadDummyBrands(ADDummyData.brands);
    if (brandCategories) BrandRepository().uploadDummyBrandCategories(ADDummyData.brandCategories);

    if (categories) CategoryRepository().uploadDummyCategories(ADDummyData.categories);

    if (products) ProductRepository().uploadDummyProducts(ADDummyData.products);
    if (productCategories) ProductRepository().uploadDummyProductCategories(ADDummyData.productCategories);
  }
}
