import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, this.width = 400, this.height = 400, this.radius = 400, this.margin, this.padding = 0, this.child, this.backgroundColor = ADColors.white});

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
