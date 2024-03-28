import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/theme/custom_themes/text_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/chip_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/input_decoration_theme.dart';

class ADTheme {
  ADTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    chipTheme: ADChipTheme.lightChipTheme,
    textTheme: ADTextTheme.lightTextTheme,
    scaffoldBackgroundColor: ADColors.white,
    appBarTheme: ADAppBarTheme.lightAppBarTheme,
    checkboxTheme: ADCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ADBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    chipTheme: ADChipTheme.darkChipTheme,
    textTheme: ADTextTheme.darkTextTheme,
    scaffoldBackgroundColor: ADColors.black,
    appBarTheme: ADAppBarTheme.darkAppBarTheme,
    checkboxTheme: ADCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: ADBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.darkInputDecorationTheme,
  );
}
