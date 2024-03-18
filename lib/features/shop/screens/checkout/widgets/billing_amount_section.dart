import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Umumiy", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$256.0", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Yetkazib berish", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Qo'shimcha", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("To'lov uchun", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$268.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ADSizes.spaceBtwItems / 2),
      ],
    );
  }
}
