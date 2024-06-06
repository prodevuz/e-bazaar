import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:ebazaar/utils/constants/colors.dart'; // Importing color constants
import 'package:ebazaar/utils/theme/custom_themes/text_theme.dart'; // Importing custom text theme
import 'package:ebazaar/utils/theme/custom_themes/chip_theme.dart'; // Importing custom chip theme
import 'package:ebazaar/utils/theme/custom_themes/appbar_theme.dart'; // Importing custom appbar theme
import 'package:ebazaar/utils/theme/custom_themes/checkbox_theme.dart'; // Importing custom checkbox theme
import 'package:ebazaar/utils/theme/custom_themes/bottom_sheet_theme.dart'; // Importing custom bottom sheet theme
import 'package:ebazaar/utils/theme/custom_themes/elevated_button_theme.dart'; // Importing custom elevated button theme
import 'package:ebazaar/utils/theme/custom_themes/outlined_button_theme.dart'; // Importing custom outlined button theme
import 'package:ebazaar/utils/theme/custom_themes/input_decoration_theme.dart'; // Importing custom input decoration theme

/// Class containing app themes
class ADTheme {
  ADTheme._();

  /// Light theme data
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

  /// Dark theme data
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
