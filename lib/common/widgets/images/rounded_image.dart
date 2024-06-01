import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/shimmers/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.height = 200,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.width = double.infinity,
    this.applyImageRadius = true,
    this.borderRadius = ADSizes.md,
    this.backgroundColor = ADColors.light,
  });

  final BoxFit fit;
  final String imageUrl;
  final BoxBorder? border;
  final double borderRadius;
  final bool isNetworkImage;
  final double width, height;
  final bool applyImageRadius;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) => ADShimmerEffect(width: width, height: height),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(fit: fit, image: AssetImage(imageUrl)),
        ),
      ),
    );
  }
}
