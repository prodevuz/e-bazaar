import 'package:get/get.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';
import 'package:ebazaar/data/repositories/user/user_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => NetworkManager());
  }
}
