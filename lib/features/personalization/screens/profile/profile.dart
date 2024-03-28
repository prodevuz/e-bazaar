import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/common/widgets/images/circular_image.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/features/personalization/screens/profile/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ADAppBar(showBackArrow: true, title: Text("Profil")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircularImage(image: ADImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text("Profil rasmini o'zgartiring")),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: ADSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ADSizes.spaceBtwItems),

              /// Heading Profile Info
              const SectionHeading(title: "Profil ma'lumotlari", showActionButton: false),
              const SizedBox(height: ADSizes.spaceBtwItems),

              ProfileMenu(onPressed: () {}, title: "Ism", value: "AbdurRahmon Davron"),
              ProfileMenu(onPressed: () {}, title: "Username", value: "prodev278"),

              const SizedBox(height: ADSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ADSizes.spaceBtwItems),

              /// Heading Personal Info
              const SectionHeading(title: "Profil ma'lumotlari", showActionButton: false),
              const SizedBox(height: ADSizes.spaceBtwItems),

              ProfileMenu(onPressed: () {}, title: "ID", icon: Iconsax.copy, value: "47728"),
              ProfileMenu(onPressed: () {}, title: "Elektron pochta", value: "abdurakhmon278@gmail.com"),
              ProfileMenu(onPressed: () {}, title: "Telefon raqam", value: "+998915550895"),
              ProfileMenu(onPressed: () {}, title: "Jins", value: "Erkak"),
              ProfileMenu(onPressed: () {}, title: "Tug'ulgan sana", value: "27 Apr, 2007"),

              const Divider(),
              const SizedBox(height: ADSizes.spaceBtwItems),

              /// Accound Delete Button
              Center(child: TextButton(onPressed: () {}, child: const Text("Hisobni o'chirish", style: TextStyle(color: Colors.red))))
            ],
          ),
        ),
      ),
    );
  }
}
