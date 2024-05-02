import 'package:get/get.dart';
import 'package:ebazaar/routes/routes.dart';
import 'package:ebazaar/features/shop/screens/home/home.dart';
import 'package:ebazaar/features/shop/screens/cart/cart.dart';
import 'package:ebazaar/features/shop/screens/store/store.dart';
import 'package:ebazaar/features/shop/screens/order/order.dart';
import 'package:ebazaar/features/shop/screens/wishlist/wishlist.dart';
import 'package:ebazaar/features/shop/screens/checkout/checkout.dart';
import 'package:ebazaar/features/authentication/screens/login/login.dart';
import 'package:ebazaar/features/authentication/screens/signup/signup.dart';
import 'package:ebazaar/features/personalization/screens/address/address.dart';
import 'package:ebazaar/features/personalization/screens/profile/profile.dart';
import 'package:ebazaar/features/personalization/screens/settings/settings.dart';
import 'package:ebazaar/features/authentication/screens/signup/verify_email.dart';
import 'package:ebazaar/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ebazaar/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ebazaar/features/authentication/screens/password_configuration/forget_password.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ADRoutes.home, page: () => const HomeScreen()),
    GetPage(name: ADRoutes.store, page: () => const StoreScreen()),
    GetPage(name: ADRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: ADRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ADRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ADRoutes.order, page: () => const OrderScreen()),
    GetPage(name: ADRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ADRoutes.cart, page: () => const CartScreen()),
    GetPage(name: ADRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ADRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ADRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: ADRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ADRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ADRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: ADRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
