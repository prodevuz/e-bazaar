import 'package:get/get.dart';
import 'package:ebazaar/utils/exceptions/exceptions.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/data/repositories/brands/brand_repository.dart';
import 'package:ebazaar/data/repositories/product/product_repository.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  /// Variables
  RxBool isLoading = true.obs;
  final brandRepository = Get.put(BrandRepository());
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured).take(4));
    } catch (e) {
      ADException(e);
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);

      return brands;
    } catch (e) {
      ADException(e);
      return [];
    }
  }

  /// Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      ADException(e);
      return [];
    }
  }
}
