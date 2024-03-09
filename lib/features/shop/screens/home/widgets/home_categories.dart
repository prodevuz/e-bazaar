import 'package:ebazaar/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: ADImages.categoryIcons.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) => VerticalImageText(image: ADImages.categoryIcons[index], title: 'Shoes', onTap: () {})
      ),
    );
  }
}
