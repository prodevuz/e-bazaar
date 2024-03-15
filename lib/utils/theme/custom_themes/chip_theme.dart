import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class ADChipTheme {
  ADChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ADColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: ADColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ADColors.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    // disabledColor: ADColors.darkerGrey,
    labelStyle: TextStyle(color: ADColors.white),
    selectedColor: ADColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ADColors.white,
  );
}
