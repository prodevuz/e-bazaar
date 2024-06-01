import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    required this.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = ADSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(color: backgroundColor ?? (dark ? ADColors.black : ADColors.white), borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: image,
                  color: overlayColor,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) => const ADShimmerEffect(height: 55, width: 55),
                )
              : Image(
                  fit: fit,
                  color: overlayColor,
                  image: AssetImage(image),
                ),
        ),
      ),
    );
  }
}
