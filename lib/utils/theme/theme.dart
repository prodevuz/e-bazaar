import 'package:ebazaar/utils/theme/custom_themes/input_decoration_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/chip_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ebazaar/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomInputDecorationTheme.darkInputDecorationTheme,


  );
}
