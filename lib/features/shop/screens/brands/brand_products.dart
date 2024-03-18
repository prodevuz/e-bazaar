import 'package:ebazaar/common/widgets/brands/brand_card.dart';
import 'package:ebazaar/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ADAppBar(title: Text("Nike"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              BrandCard(showBorder: true),
              SizedBox(height: ADSizes.spaceBtwSections),

              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
