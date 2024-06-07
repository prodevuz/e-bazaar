import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.
import 'package:ebazaar/utils/constants/colors.dart'; // Importing custom color constants for the app.
import 'package:ebazaar/utils/helpers/helper_functions.dart'; // Importing helper functions.
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart'; // Importing circular container widget.

/// A custom choice chip widget.
class ADChoiceChip extends StatelessWidget {
  const ADChoiceChip({super.key, required this.selected, required this.text, this.onSelected});

  final String text; // The text displayed on the chip.
  final bool selected; // Whether the chip is selected.
  final void Function(bool)? onSelected; // Callback function when the chip is selected.

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null; // Check if the text represents a color.

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent), // Set the canvas color to transparent.
      child: ChoiceChip(
        selected: selected, // Set whether the chip is selected.
        onSelected: onSelected, // Set the selection callback function.
        shape: isColor ? const CircleBorder() : null, // Set the shape to circular if the text represents a color.
        selectedColor: HelperFunctions.getColor(text), // Set the selected color based on the text.
        label: isColor ? const SizedBox() : Text(text), // Display text label if not representing a color.
        padding: isColor ? const EdgeInsets.all(0) : null, // Set padding to zero if representing a color.
        labelPadding: isColor ? const EdgeInsets.all(0) : null, // Set label padding to zero if representing a color.
        labelStyle: TextStyle(color: selected ? ADColors.white : null), // Set label color to white if selected.
        backgroundColor: isColor ? HelperFunctions.getColor(text) : null, // Set background color based on the text.
        avatar: isColor ? CircularContainer(height: 50, width: 50, backgroundColor: HelperFunctions.getColor(text)!) : null, // Display circular container as avatar if representing a color.
      ),
    );
  }
}
