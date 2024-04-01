import 'package:ebazaar/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/features/personalization/screens/profile/profile.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserRepository.instance;

    return ListTile(
      leading: const CircularImage(image: ADImages.user, width: 50, height: 50, padding: 0),
      title: Text(controller.currentUser.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white)),
      subtitle: Text(controller.currentUser.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ADColors.white)),
      trailing: IconButton(onPressed: () => Get.to(const ProfileScreen()), icon: const Icon(Iconsax.edit, color: ADColors.white)),
    );
  }
}
