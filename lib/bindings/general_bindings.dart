import 'package:get/get.dart'; // Importing GetX package for state management.
import 'package:ebazaar/navigation_menu.dart'; // Importing the navigation menu.
import 'package:ebazaar/utils/helpers/network_manager.dart'; // Importing network manager helper.
import 'package:ebazaar/data/repositories/user/user_repository.dart'; // Importing user repository.
import 'package:ebazaar/data/services/firebase_storage_service.dart'; // Importing Firebase storage service.
import 'package:ebazaar/features/shop/controllers/brand_controller.dart'; // Importing brand controller.
import 'package:ebazaar/data/repositories/banners/banner_repository.dart'; // Importing banner repository.
import 'package:ebazaar/features/shop/controllers/banner_controller.dart'; // Importing banner controller.
import 'package:ebazaar/data/repositories/address/address_repository.dart'; // Importing address repository.
import 'package:ebazaar/data/repositories/product/product_repository.dart'; // Importing product repository.
import 'package:ebazaar/features/shop/controllers/category_controller.dart'; // Importing category controller.
import 'package:ebazaar/data/repositories/categories/category_repository.dart'; // Importing category repository.
import 'package:ebazaar/features/shop/controllers/all_products_controller.dart'; // Importing all products controller.
import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart'; // Importing cart controller.
import 'package:ebazaar/features/personalization/controllers/user_controller.dart'; // Importing user controller.
import 'package:ebazaar/features/shop/controllers/products/images_controller.dart'; // Importing images controller.
import 'package:ebazaar/features/shop/controllers/products/product_controller.dart'; // Importing product controller.
import 'package:ebazaar/features/shop/controllers/products/variation_controller.dart'; // Importing variation controller.
import 'package:ebazaar/features/shop/controllers/products/favourite_controller.dart'; // Importing favourite controller.
import 'package:ebazaar/features/personalization/controllers/address_controller.dart'; // Importing address controller.
import 'package:ebazaar/data/repositories/authentication/authentication_repository.dart'; // Importing authentication repository.
import 'package:ebazaar/features/authentication/controllers/login/login_controller.dart'; // Importing login controller.
import 'package:ebazaar/features/personalization/controllers/theme_mode_controller.dart'; // Importing theme mode controller.
import 'package:ebazaar/features/personalization/controllers/update_name_controller.dart'; // Importing update name controller.
import 'package:ebazaar/features/authentication/controllers/signup/signup_controller.dart'; // Importing signup controller.
import 'package:ebazaar/features/authentication/controllers/signup/verify_email_controller.dart'; // Importing verify email controller.
import 'package:ebazaar/features/authentication/controllers/onboarding/onboarding_controller.dart'; // Importing onboarding controller.
import 'package:ebazaar/features/authentication/controllers/forget_password/forget_password_controller.dart'; // Importing forget password controller.

/// Class for general bindings.
class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController()); // Registering UserController as a dependency.
    Get.put(UserRepository()); // Registering UserRepository as a dependency.
    Get.put(CartController()); // Registering CartController as a dependency.
    Get.put(BrandController()); // Registering BrandController as a dependency.
    Get.put(BannerController()); // Registering BannerController as a dependency.
    Get.put(BannerRepository()); // Registering BannerRepository as a dependency.
    Get.put(ProductController()); // Registering ProductController as a dependency.
    Get.put(ProductRepository()); // Registering ProductRepository as a dependency.
    Get.put(CategoryController()); // Registering CategoryController as a dependency.
    Get.put(CategoryRepository()); // Registering CategoryRepository as a dependency.
    Get.put(ThemeModeController()); // Registering ThemeModeController as a dependency.
    Get.put(FavouriteController()); // Registering FavouriteController as a dependency.
    Get.put(NavigationController()); // Registering NavigationController as a dependency.
    Get.put(AllProductsController()); // Registering AllProductsController as a dependency.
    Get.put(AuthenticationRepository()); // Registering AuthenticationRepository as a dependency.
    Get.put(ADFirebaseStorageService()); // Registering FirebaseStorageService as a dependency.

    Get.lazyPut(() => NetworkManager()); // Lazily registering NetworkManager as a dependency.
    Get.lazyPut(() => LoginController()); // Lazily registering LoginController as a dependency.
    Get.lazyPut(() => SignupController()); // Lazily registering SignupController as a dependency.
    Get.lazyPut(() => ImagesController()); // Lazily registering ImagesController as a dependency.
    Get.lazyPut(() => AddressController()); // Lazily registering AddressController as a dependency.
    Get.lazyPut(() => AddressRepository()); // Lazily registering AddressRepository as a dependency.
    Get.lazyPut(() => VariationController()); // Lazily registering VariationController as a dependency.
    Get.lazyPut(() => OnboardingController()); // Lazily registering OnboardingController as a dependency.
    Get.lazyPut(() => UpdateNameController()); // Lazily registering UpdateNameController as a dependency.
    Get.lazyPut(() => VerifyEmailController()); // Lazily registering VerifyEmailController as a dependency.
    Get.lazyPut(() => ForgetPasswordController()); // Lazily registering ForgetPasswordController as a dependency.
  }
}
