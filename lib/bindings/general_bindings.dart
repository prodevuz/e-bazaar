import 'package:get/get.dart'; // Importing GetX package for state management
import 'package:ebazaar/utils/helpers/network_manager.dart'; // Importing network manager helper
import 'package:ebazaar/data/repositories/user/user_repository.dart'; // Importing user repository
import 'package:ebazaar/features/shop/controllers/products/variation_controller.dart'; // Importing variation controller

/// Class for general bindings
class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.lazyPut(() => NetworkManager());
    Get.put(VariationController());
  }
}
