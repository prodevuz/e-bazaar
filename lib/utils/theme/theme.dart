import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/theme/custom_themes/input_decoration_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/chip_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ADTheme {
  ADTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: ADColors.white,
    textTheme: ADTextTheme.lightTextTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ADAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ADBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: ADCheckboxTheme.lightCheckboxTheme,
    chipTheme: ADChipTheme.lightChipTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ADTextTheme.darkTextTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ADAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: ADBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: ADCheckboxTheme.darkCheckboxTheme,
    chipTheme: ADChipTheme.darkChipTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.darkInputDecorationTheme,
  );
}
