import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';

/// A tile widget used in settings menu.
class SettingsMenuTile extends StatelessWidget {
  /// Icon displayed on the left side of the tile.
  final IconData icon;

  /// Widget displayed on the right side of the tile.
  final Widget? trailing;

  /// Callback function when the tile is tapped.
  final VoidCallback? onTap;

  /// Title text displayed on the tile.
  final String title;

  /// Subtitle text displayed below the title.
  final String subTitle;

  /// Constructs a SettingsMenuTile widget.
  const SettingsMenuTile({
    super.key,
    this.onTap,
    this.trailing,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap, // Assign onTap callback to the ListTile.
      trailing: trailing, // Assign trailing widget to the ListTile.
      leading: Icon(icon, size: 28, color: ADColors.primary), // Icon displayed on the left side.
      title: Text(title, style: Theme.of(context).textTheme.titleMedium), // Title text.
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium), // Subtitle text.
    );
  }
}
