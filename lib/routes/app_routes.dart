import 'package:get/get.dart'; // Importing GetX package for routing
import 'package:ebazaar/routes/routes.dart'; // Importing route names
import 'package:ebazaar/features/shop/screens/home/home.dart'; // Importing home screen
import 'package:ebazaar/features/shop/screens/cart/cart.dart'; // Importing cart screen
import 'package:ebazaar/features/shop/screens/store/store.dart'; // Importing store screen
import 'package:ebazaar/features/shop/screens/order/order.dart'; // Importing order screen
import 'package:ebazaar/features/shop/screens/wishlist/wishlist.dart'; // Importing wishlist screen
import 'package:ebazaar/features/shop/screens/checkout/checkout.dart'; // Importing checkout screen
import 'package:ebazaar/features/authentication/screens/login/login.dart'; // Importing login screen
import 'package:ebazaar/features/authentication/screens/signup/signup.dart'; // Importing signup screen
import 'package:ebazaar/features/personalization/screens/address/address.dart'; // Importing address screen
import 'package:ebazaar/features/personalization/screens/profile/profile.dart'; // Importing profile screen
import 'package:ebazaar/features/personalization/screens/settings/settings.dart'; // Importing settings screen
import 'package:ebazaar/features/authentication/screens/signup/verify_email.dart'; // Importing verify email screen
import 'package:ebazaar/features/shop/screens/product_reviews/product_reviews.dart'; // Importing product reviews screen
import 'package:ebazaar/features/authentication/screens/onboarding/onboarding.dart'; // Importing onboarding screen
import 'package:ebazaar/features/authentication/screens/password_configuration/forget_password.dart'; // Importing forget password screen

/// Class containing all the app routes
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
    GetPage(name: ADRoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
