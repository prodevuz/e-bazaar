import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/features/personalization/screens/profile/profile.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';

/// A ListTile widget representing the user profile details.
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance; // Instance of the UserController.

    // ListTile displaying user profile information.
    return ListTile(
      // Subtitle displaying user email.
      subtitle: Text(
        controller.user.value.email, // Get user email from the controller.
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: ADColors.white), // Apply text style.
      ),
      // Title displaying user full name.
      title: Text(
        controller.user.value.fullName, // Get user full name from the controller.
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white), // Apply text style.
      ),
      // IconButton to navigate to profile editing screen.
      trailing: IconButton(
        onPressed: () => Get.to(const ProfileScreen()), // Navigate to ProfileScreen on button press.
        icon: const Icon(Iconsax.edit, color: ADColors.white), // Edit icon.
      ),
      // CircularImage widget displaying user profile picture.
      leading: CircularImage(
        image: controller.user.value.profilePicture, // Get user profile picture from the controller.
        width: 50, // Set image width.
        height: 50, // Set image height.
        padding: 0, // Set padding.
        fit: BoxFit.cover, // Set image fit.
        isNetworkImage: true, // Specify whether the image is from network.
      ),
    );
  }
}
