import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width = double.infinity,
    this.height = 200,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = ADColors.light,
    this.fit = BoxFit.contain, /// BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = ADSizes.md,
  });

  final double width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

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
          child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
