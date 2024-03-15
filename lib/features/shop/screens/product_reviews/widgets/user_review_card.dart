import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ebazaar/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(ADImages.user)),
                const SizedBox(width: ADSizes.spaceBtwItems),
                Text("AbdurRohman Davron", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const ADRatingBarIndicator(rating: 4),
            const SizedBox(width: ADSizes.spaceBtwItems),
            Text("14 Mar, 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems),

        const ReadMoreText(
          "Fikr va mulohazalar tasdiqlangan va ular siz bilan bir xil turdagi qurilma ishlatadigan odamlar tomonidan yozilgan. Fikr va mulohazalar tasdiqlangan va ular siz bilan bir xil turdagi qurilma ishlatadigan odamlar tomonidan yozilgan.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " Kamroq",
          trimCollapsedText: " Ko'proq",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ADColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ADColors.primary),
        ),
        const SizedBox(height: ADSizes.spaceBtwItems),

        /// Company Review
        RoundedContainer(
          backgroundColor: dark ? ADColors.darkerGrey : ADColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ADSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("AD's Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("13 Mar, 2024", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: ADSizes.spaceBtwItems),
                const ReadMoreText(
                  "Fikr va mulohazalar tasdiqlangan va ular siz bilan bir xil turdagi qurilma ishlatadigan odamlar tomonidan yozilgan. Fikr va mulohazalar tasdiqlangan va ular siz bilan bir xil turdagi qurilma ishlatadigan odamlar tomonidan yozilgan.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " Kamroq",
                  trimCollapsedText: " Ko'proq",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ADColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ADColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ADSizes.spaceBtwSections),
      ],
    );
  }
}
