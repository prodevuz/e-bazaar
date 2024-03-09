import 'package:flutter/material.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ADAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ADTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: ADColors.grey)),
          Text(ADTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ADColors.white)),
        ],
      ),
      actions: [
        CartCounterIcon(onPressed: () {}, isHome: true),
      ],
    );
  }
}
