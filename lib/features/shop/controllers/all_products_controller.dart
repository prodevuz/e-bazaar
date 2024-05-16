import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/exceptions/exceptions.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/data/repositories/product/product_repository.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Nomi'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      ADException(e);
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Nomi':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Qimmatroq':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Arzonroq':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Eng yangi':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Chegirma':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the 'products' list
    this.products.assignAll(products);
    sortProducts('Nomi');
  }
}
