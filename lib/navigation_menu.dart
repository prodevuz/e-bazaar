import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/features/shop/screens/home/home.dart';
import 'package:ebazaar/features/shop/screens/store/store.dart';
import 'package:ebazaar/features/shop/screens/wishlist/wishlist.dart';
import 'package:ebazaar/features/personalization/screens/settings/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              backgroundColor: darkMode ? ADColors.black : ADColors.white,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              indicatorColor: darkMode ? ADColors.white.withOpacity(0.1) : ADColors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Asosiy"),
                NavigationDestination(icon: Icon(Iconsax.shop), label: "Do'kon"),
                NavigationDestination(icon: Icon(Iconsax.heart), label: "Yoqtirilgan"),
                NavigationDestination(icon: Icon(Iconsax.user), label: "Profil"),
              ])),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
}
