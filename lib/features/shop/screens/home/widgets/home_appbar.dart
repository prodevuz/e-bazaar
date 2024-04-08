import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';
import 'package:ebazaar/common/widgets/effects/shimmer.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/features/personalization/controllers/user_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ADAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(ADTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: ADColors.grey)),
        Obx(() {
          if (controller.profileLoading.value) {
            return const ADShimmerEffect(width: 80, height: 15);
          } else {
            return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white));
          }
        }),
      ]),
      actions: const [CartCounterIcon(isHome: true)],
    );
  }
}
