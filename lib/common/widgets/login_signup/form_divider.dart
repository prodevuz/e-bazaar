import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(child: Divider(color: dark ? ADColors.darkGrey : ADColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
      Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
      Flexible(child: Divider(color: dark ? ADColors.darkGrey : ADColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
    ]);
  }
}
