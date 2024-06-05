import 'package:ebazaar/features/shop/controllers/products/cart_controller.dart';
import 'package:ebazaar/features/shop/screens/product_details/product_detail.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return GestureDetector(
      onTap: () {
        // If the product has variations then show the product details for variation selection
        // Else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

          return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? ADColors.primary : ADColors.dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ADSizes.cardRadiusMd),
                bottomRight: Radius.circular(ADSizes.productImageRadius),
              ),
            ),
            child: SizedBox(
              width: ADSizes.iconLg * 1.2,
              height: ADSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: ADColors.white),
                      )
                    : const Icon(Iconsax.add, color: ADColors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
