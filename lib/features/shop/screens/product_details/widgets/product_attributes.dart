import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/utils/helpers/helper_functions.dart';
import 'package:ebazaar/common/widgets/chips/choice_chips.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/texts/section_heading.dart';
import 'package:ebazaar/common/widgets/texts/product_title_text.dart';
import 'package:ebazaar/common/widgets/texts/product_price_text.dart';
import 'package:ebazaar/features/shop/controllers/products/variation_controller.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = VariationController.instance;

    return Obx(
      () => Column(children: [
        /// Selected Attributes Pricing & Description
        if (controller.selectedVariation.value.id.isNotEmpty)
          RoundedContainer(
            padding: const EdgeInsets.all(ADSizes.md),
            backgroundColor: dark ? ADColors.darkerGrey : ADColors.grey,
            child: Column(children: [
              /// Title, Price & Stock Status
              Row(children: [
                const SectionHeading(title: "Tur:", showActionButton: false),
                const SizedBox(width: ADSizes.spaceBtwItems),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const ProductTitleText(title: "Narx : ", smallSize: true),

                    /// Actual Price
                    if (controller.selectedVariation.value.salePrice > 0)
                      Text('\$${controller.selectedVariation.value.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                    const SizedBox(width: ADSizes.spaceBtwItems),

                    /// Sale Price
                    ProductPriceText(price: controller.getVariationPrice()),
                  ]),

                  /// Stack
                  Row(children: [
                    const ProductTitleText(title: "Mavjudligi : ", smallSize: true),
                    Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                  ]),
                ]),
              ]),

              /// Variation Description
              ProductTitleText(title: controller.selectedVariation.value.description ?? '', smallSize: true, maxLines: 4),
            ]),
          ),
        const SizedBox(height: ADSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(title: attribute.name ?? '', showActionButton: false),
                    const SizedBox(height: ADSizes.spaceBtwItems / 2),
                    Obx(
                      () => Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                          final available = controller.getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);

                          return ADChoiceChip(
                            text: attributeValue,
                            selected: isSelected,
                            onSelected: available
                                ? (selected) {
                                    if (selected && available) controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                  }
                                : null,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ]),
    );
  }
}
