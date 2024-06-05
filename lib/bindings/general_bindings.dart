import 'package:get/get.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';
import 'package:ebazaar/features/shop/controllers/products/variation_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.lazyPut(() => NetworkManager());
    Get.put(VariationController());
  }
}
