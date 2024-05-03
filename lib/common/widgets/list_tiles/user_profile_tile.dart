import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/features/personalization/screens/profile/profile.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: CircularImage(image: controller.user.value.profilePicture, width: 50, height: 50, padding: 0, fit: BoxFit.cover, isNetworkImage: true),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ADColors.white)),
      trailing: IconButton(onPressed: () => Get.to(const ProfileScreen()), icon: const Icon(Iconsax.edit, color: ADColors.white)),
    );
  }
}
