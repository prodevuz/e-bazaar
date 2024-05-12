import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/product_description_text.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ebazaar/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(children: [
          /// Product Image Slider
          ProductImageSlider(product: product),

          /// Product Details
          Padding(
            padding: const EdgeInsets.only(right: ADSizes.defaultSpace, left: ADSizes.defaultSpace, bottom: ADSizes.defaultSpace),
            child: Column(children: [
              /// Rating & Share Button
              const RatingAndShare(),

              /// Price, Title, Stock & Brand
              ProductMetaData(product: product),

              /// Attributes
              if (product.productType == ProductType.variable.toString()) ProductAttributes(product: product),
              if (product.productType == ProductType.variable.toString()) const SizedBox(height: ADSizes.spaceBtwSections),

              /// Checkout Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Rasmiylashtirish"))),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// Description
              const SectionHeading(title: "Tavsif", showActionButton: false),
              const SizedBox(height: ADSizes.spaceBtwItems),
              ProductDescriptionText(text: product.description ?? ''),

              /// Reviews
              const Divider(),
              const SizedBox(height: ADSizes.spaceBtwItems),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SectionHeading(title: "Fikrlar(199)", onPressed: () {}, showActionButton: false),
                IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18)),
              ]),
              const SizedBox(height: ADSizes.spaceBtwSections),
            ]),
          ),
        ]),
      ),
    );
  }
}
