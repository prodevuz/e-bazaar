import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = ADColors.white,
  });

  final String image, title;
  final Color textColor;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ADSizes.spaceBtwItems),
        child: Column(children: [
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(ADSizes.sm),
            decoration: BoxDecoration(color: backgroundColor ?? (dark ? ADColors.black : ADColors.white), borderRadius: BorderRadius.circular(100)),
            child: isNetworkImage
                ? CachedNetworkImage(imageUrl: image, color: dark ? ADColors.light : ADColors.dark)
                : Image(fit: BoxFit.cover, image: AssetImage(image), color: dark ? ADColors.light : ADColors.dark),
          ),
          const SizedBox(height: ADSizes.spaceBtwItems / 2),
          SizedBox(width: 55, child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
        ]),
      ),
    );
  }
}
