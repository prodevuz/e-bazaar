import 'package:get/get.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/features/shop/models/product_variation_model.dart';
import 'package:ebazaar/features/shop/controllers/products/images_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the selected Variation image as Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  /// Check if selected attribute matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability / Stock in Variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // Check empty / Out of stock attributes
            variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
        // Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() => (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();

  /// Check Product Variation Stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? "Sotuvda mavjud" : "Sotuvda mavjud emas";
  }

  /// Reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
