import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class ADChipTheme {
  ADChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: ADColors.white,
    selectedColor: ADColors.primary,
    disabledColor: ADColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: ADColors.white,
    selectedColor: ADColors.primary,
    disabledColor: ADColors.darkerGrey, // Todo: something
    labelStyle: TextStyle(color: ADColors.white),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
  );
}
