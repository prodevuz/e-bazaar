import 'dart:convert';

import 'package:ebazaar/data/repositories/product/product_repository.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  /// Method to initialize favourites by reading from storage
  void initFavourites() async {
    final json = LocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      ADLoaders.customToast(message: "Maxsulot yoqtirilganlar ro'yxatiga qo'shildi!");
    } else {
      LocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      ADLoaders.customToast(message: "Maxsulot yoqtirilganlar ro'yxatidan o'chirib tashlandi.");
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    LocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
