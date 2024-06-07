import 'package:get/get.dart'; // Import the GetX package for state management.
import 'package:iconsax/iconsax.dart'; // Import the Iconsax package for using custom icons.
import 'package:flutter/material.dart'; // Import the Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Import custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Import helper functions used in the app.
import 'package:ebazaar/features/shop/screens/home/home.dart'; // Import the home screen for the shop feature.
import 'package:ebazaar/features/shop/screens/store/store.dart'; // Import the store screen for the shop feature.
import 'package:ebazaar/features/shop/screens/wishlist/wishlist.dart'; // Import the wishlist screen for the shop feature.
import 'package:ebazaar/features/personalization/screens/settings/settings.dart'; // Import the settings screen for the personalization feature.

/// A stateless widget that represents the navigation menu of the app.
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key}); // Constructor for the NavigationMenu widget.

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController(); // Instantiate the NavigationController using GetX.
    final darkMode = HelperFunctions.isDarkMode(context); // Check if the app is in dark mode.

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80, // Set the height of the bottom navigation bar.
            elevation: 0, // Remove the shadow effect from the navigation bar.
            selectedIndex: controller.selectedIndex.value, // Bind the selected index to the controller.
            backgroundColor: darkMode ? ADColors.black : ADColors.white, // Set the background color based on the theme.
            onDestinationSelected: (index) => controller.selectedIndex.value = index, // Update the selected index when a destination is selected.
            indicatorColor: darkMode ? ADColors.white.withOpacity(0.1) : ADColors.black.withOpacity(0.1), // Set the indicator color based on the theme.
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Asosiy"), // Define the home destination.
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Do'kon"), // Define the store destination.
              NavigationDestination(icon: Icon(Iconsax.heart), label: "Yoqtirilgan"), // Define the wishlist destination.
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profil"), // Define the profile destination.
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]), // Display the screen corresponding to the selected index.
    );
  }
}

/// A GetX controller to manage the state of the navigation menu.
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; // Observable integer to hold the selected index of the navigation menu.
  final screens = [
    const HomeScreen(), // Home screen widget.
    const StoreScreen(), // Store screen widget.
    const FavouriteScreen(), // Wishlist screen widget.
    const SettingsScreen() // Settings screen widget.
  ]; // List of screens corresponding to each navigation destination.
}
