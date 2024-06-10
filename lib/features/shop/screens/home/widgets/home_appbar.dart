import 'package:get/get.dart'; // Importing the Get package for state management.
import 'package:flutter/material.dart'; // Importing the material library for Flutter UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing color constants used in the app.
import 'package:ebazaar/common/widgets/appbar/appbar.dart'; // Importing the custom appbar widget.
import 'package:ebazaar/utils/constants/text_strings.dart'; // Importing constant text strings used in the app.
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart'; // Importing the shimmer effect widget.
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart'; // Importing the cart menu icon widget.
import 'package:ebazaar/features/personalization/controllers/user_controller.dart'; // Importing the user controller.

class HomeAppBar extends StatelessWidget {
  // Defining a stateless widget for the home app bar.
  const HomeAppBar({Key? key}) : super(key: key); // Constructor for the HomeAppBar widget.

  @override
  Widget build(BuildContext context) {
    // Build method for constructing the widget.
    final controller = UserController.instance; // Accessing the user controller instance.

    return ADAppBar(
      // Returning a custom app bar widget.
      title: Column(
        // App bar title consisting of a column for multiple text elements.
        crossAxisAlignment: CrossAxisAlignment.start, // Aligning text elements to start horizontally.
        children: [
          Text(
            // Text widget for the app bar title.
            ADTexts.homeAppbarTitle, // Fetching the title text from constants.
            style: Theme.of(context).textTheme.labelMedium!.apply(color: ADColors.grey), // Styling the title text.
          ),
          Obx(() {
            // Using GetX Obx for reactive UI update based on controller state.
            if (controller.profileLoading.value) {
              // Checking if user profile is loading.
              return const ADShimmerEffect(width: 80, height: 15); // Displaying a shimmer effect while loading.
            } else {
              // If profile loading is complete.
              return Text(
                // Text widget displaying user's full name.
                controller.user.value.fullName, // Fetching user's full name from controller.
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white), // Styling the text.
              );
            }
          }),
        ],
      ),
      actions: const [
        // Defining app bar actions, such as icons or buttons.
        CartCounterIcon(
          // Adding the cart counter icon.
          iconColor: ADColors.white, // Setting icon color.
          counterBgColor: ADColors.black, // Setting background color for the counter.
          counterTextColor: ADColors.white, // Setting text color for the counter.
        ),
      ],
    );
  }
}
