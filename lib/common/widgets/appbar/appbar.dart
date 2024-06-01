import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/device/device_utility.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';

class ADAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ADAppBar({
    super.key,
    this.title,
    this.actions,
    this.arrowColor,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final Color? arrowColor;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ADSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: arrowColor ?? (dark ? ADColors.white : ADColors.dark)))
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADDeviceUtils.getAppBarHeight());
}
