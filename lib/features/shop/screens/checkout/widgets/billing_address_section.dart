import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionHeading(title: "Yetkazib berish manzili", buttonTitle: "O'zgartirish", onPressed: () {}),
      Text("AbdurRohman Davron", style: Theme.of(context).textTheme.bodyLarge),
      const SizedBox(height: ADSizes.spaceBtwItems / 2),
      Row(children: [
        const Icon(Icons.phone, color: Colors.grey, size: 16),
        const SizedBox(width: ADSizes.spaceBtwItems),
        Text("+998 (91) 555-08-95", style: Theme.of(context).textTheme.bodyMedium),
      ]),
      const SizedBox(height: ADSizes.spaceBtwItems / 2),
      Row(children: [
        const Icon(Icons.location_history, color: Colors.grey, size: 16),
        const SizedBox(width: ADSizes.spaceBtwItems),
        Text("Soyguzar, Urgut, Samarqand, O'zbekiston", style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
      ]),
    ]);
  }
}
