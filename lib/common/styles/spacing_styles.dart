import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomSpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    left: CustomSizes.defaultSpace,
    bottom: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace,
  );
}
