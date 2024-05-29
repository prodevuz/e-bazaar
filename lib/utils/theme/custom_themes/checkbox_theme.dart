import 'package:flutter/material.dart';

class ADCheckboxTheme {
  ADCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : Colors.black), // Todo: return with if else
    fillColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.blue : Colors.transparent), // Todo: return with if else
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : Colors.black), // Todo: return with if else
    fillColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.blue : Colors.transparent), // Todo: return with if else
  );
}
