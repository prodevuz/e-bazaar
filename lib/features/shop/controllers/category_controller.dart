import 'package:get/get.dart';
import 'package:ebazaar/utils/exceptions/exceptions.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/data/repositories/product/product_repository.dart';
import 'package:ebazaar/data/repositories/categories/category_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from Firestore
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      ADException(e);
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Load selected Category data

  /// Get Category or Sub Category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
