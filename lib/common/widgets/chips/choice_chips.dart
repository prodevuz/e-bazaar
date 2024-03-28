import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart';

class ADChoiceChip extends StatelessWidget {
  const ADChoiceChip({super.key, required this.selected, required this.text, this.onSelected});
 
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? ADColors.white : null),
        avatar: isColor ? CircularContainer(height: 50, width: 50, backgroundColor: HelperFunctions.getColor(text)!) : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        selectedColor: HelperFunctions.getColor(text),
        backgroundColor: isColor ? HelperFunctions.getColor(text) : null,
      ),
    );
  }
}
