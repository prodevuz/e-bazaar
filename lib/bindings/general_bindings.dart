import 'package:get/get.dart';
import 'package:ebazaar/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager());
  }
}
