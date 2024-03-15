import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:ebazaar/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/primary_header_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  ADAppBar(title: Text('Hisob', style: Theme.of(context).textTheme.headlineMedium!.apply(color: ADColors.white))),

                  /// User Profile Card
                  const UserProfileTile(),
                  const SizedBox(height: ADSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ADSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const SectionHeading(title: 'Hisob sozlamalari', showActionButton: false),
                  const SizedBox(height: ADSizes.spaceBtwItems),

                  const SettingsMenuTile(icon: Iconsax.safe_home, title: "Manzillarim", subTitle: "Yetkazib berish manzilini tanlang"),
                  const SettingsMenuTile(icon: Iconsax.shopping_cart, title: "Savat", subTitle: "Maxsulotlarni qo'shing, olib tashlang va buyurtma bering"),
                  const SettingsMenuTile(icon: Iconsax.bag_tick, title: "Buyurtmalarim", subTitle: "Jarayondagi va tugallangan buyurtmalar"),
                  const SettingsMenuTile(icon: Iconsax.bank, title: "Bank hisobi", subTitle: "Bank hisobi balansi"),
                  const SettingsMenuTile(icon: Iconsax.discount_shape, title: "Kuponlarim", subTitle: "Chegirma kuponlar ro'yxati"),
                  const SettingsMenuTile(icon: Iconsax.notification, title: "Bildirishnomalar", subTitle: "Har qanday turdagi bildirishnoma xabarini belgilang"),
                  const SettingsMenuTile(icon: Iconsax.security_card, title: "Hisob maxfiyligi", subTitle: "Ma'lumotdan foydalanish va ulangan hisoblarni boshqaring"),

                  /// App Settings
                  const SizedBox(height: ADSizes.spaceBtwSections),
                  const SectionHeading(title: "Ilova sozlamalari", showActionButton: false),
                  const SizedBox(height: ADSizes.spaceBtwItems),
                  const SettingsMenuTile(icon: Iconsax.document_upload, title: "Ma'lumot yuklang", subTitle: "Cloud Firebasega ma'lumot yuklang"),
                  SettingsMenuTile(icon: Iconsax.location, title: "Geojoylashuv", subTitle: "Joylashuvga moslangan tavsiyalar", trailing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(icon: Iconsax.security_user, title: "Xavfsiz rejim", subTitle: "Barcha yoshdagilar uchun xavfsiz maxsulotlar", trailing: Switch(value: false, onChanged: (value) {})),
                  SettingsMenuTile(icon: Iconsax.image, title: "HD sifatli rasmlar", subTitle: "Rasmlar sifatini belgilang", trailing: Switch(value: false, onChanged: (value) {})),

                  /// Logout Button
                  const SizedBox(height: ADSizes.spaceBtwSections),
                  SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text("Chiqish"))),
                  const SizedBox(height: ADSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
