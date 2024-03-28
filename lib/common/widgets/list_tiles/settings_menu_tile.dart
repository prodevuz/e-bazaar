import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, this.onTap, this.trailing, required this.icon, required this.title, required this.subTitle});

  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: ADColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
