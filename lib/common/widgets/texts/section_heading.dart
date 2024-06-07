import 'package:flutter/material.dart'; // Flutter material package for UI components.

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    required this.title, // Title of the section heading.
    this.showActionButton = true, // Whether to show the action button.
    this.buttonTitle = "Barchasi", // Title of the action button.
  });

  final Color? textColor; // Color of the text.
  final bool showActionButton; // Whether to show the action button.
  final String title, buttonTitle; // Title of the section heading and action button.
  final void Function()? onPressed; // Callback function for the action button.

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title, // Display the title text.
        maxLines: 1, // Set the maximum number of lines.
        overflow: TextOverflow.ellipsis, // Handle overflow by ellipsis.
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), // Apply text style with optional textColor.
      ),
      if (showActionButton) // Conditionally display the action button.
        TextButton(onPressed: onPressed, child: Text(buttonTitle)), // Display the action button with its title.
    ]);
  }
}
