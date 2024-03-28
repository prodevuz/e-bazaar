import 'package:flutter/material.dart';

class ADCheckboxTheme {
  ADCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.white : Colors.black), // Todo: return with if else
    fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.blue : Colors.transparent), // Todo: return with if else
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.white : Colors.black), // Todo: return with if else
    fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.blue : Colors.transparent), // Todo: return with if else
  );
}
