import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/device/device_utility.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ADTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ADTabBar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? ADColors.black : ADColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: ADColors.primary,
        labelColor: dark ? ADColors.white : ADColors.primary,
        unselectedLabelColor: ADColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADDeviceUtils.getAppBarHeight());
}
