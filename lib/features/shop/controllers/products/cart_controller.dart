import 'package:get/get.dart';
import 'package:ebazaar/utils/constants/enums.dart';
import 'package:ebazaar/utils/loaders/loaders.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/utils/local_storage/storage_utility.dart';
import 'package:ebazaar/features/shop/models/cart_item_model.dart';
import 'package:ebazaar/features/shop/controllers/products/variation_controller.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  /// Constructor
  CartController() {
    loadCartItems();
  }

  /// Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart.value < 1) {
      ADLoaders.customToast(message: "Miqdorni tanlang");
      return;
    }

    // Variation selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      ADLoaders.customToast(message: "Xususiyatlarni tanlang");
      return;
    }

    /// Out of stock status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        ADLoaders.warningSnackBar(title: "Diqqat", message: "Tanlangan xususiyatli maxsulot sotuvda mavjud emas");
        return;
      }
    } else {
      if (product.stock < 1) {
        ADLoaders.warningSnackBar(title: "Diqqat", message: "Tanlangan maxsulot sotuvda mavjud emas");
        return;
      }
    }

    // Convert ProductModel to CartItemModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the Cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // This quantity already added or Updated/Removed from the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    ADLoaders.customToast(message: "Maxsulot savatga qo'shildi");
  }

  /// Add one item to the cart
  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  /// Remove one item from cart
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
    }

    updateCart();
  }

  /// Init already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number
    // Else make default entries to 0 and show cartEntries when variation is selected
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  /// Dialog removing item from cart
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Maxsulotni olib tashlash",
      middleText: "Maxsulotni savatdan olib tashlashga ishonchingiz komilmi?",
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        ADLoaders.customToast(message: "Maxsulot savatdan olib tashlandi");
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  /// Convert ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// Update Cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = LocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
