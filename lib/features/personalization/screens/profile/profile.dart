import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';
import 'package:ebazaar/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ebazaar/features/personalization/screens/profile/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance.user.value;

    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true, title: Text("Profil")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(children: [
                CircularImage(image: controller.profilePicture, width: 80, height: 80),
                TextButton(onPressed: () {}, child: const Text("Profil rasmini o'zgartiring")),
              ]),
            ),

            /// Details
            const SizedBox(height: ADSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Heading Profile Info
            const SectionHeading(title: "Profil ma'lumotlari", showActionButton: false),
            const SizedBox(height: ADSizes.spaceBtwItems),

            ProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: "Ism", value: controller.fullName),
            ProfileMenu(onPressed: () {}, title: "Username", value: controller.username),

            const SizedBox(height: ADSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Heading Personal Info
            const SectionHeading(title: "Profil ma'lumotlari", showActionButton: false),
            const SizedBox(height: ADSizes.spaceBtwItems),

            ProfileMenu(onPressed: () {}, title: "ID", icon: Iconsax.copy, value: controller.id),
            ProfileMenu(onPressed: () {}, title: "Elektron pochta", value: controller.email),
            ProfileMenu(onPressed: () {}, title: "Telefon raqam", value: controller.phoneNumber),
            ProfileMenu(onPressed: () {}, title: "Jins", value: "Erkak"),
            ProfileMenu(onPressed: () {}, title: "Tug'ulgan sana", value: "27 Apr, 2007"),

            const Divider(),
            const SizedBox(height: ADSizes.spaceBtwItems),

            /// Accound Delete Button
            Center(
              child: TextButton(
                onPressed: () => UserController.instance.deleteAccountWarningPopup(),
                child: const Text("Hisobni o'chirish", style: TextStyle(color: Colors.red)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
