class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.quantity,
    required this.productId,
    this.image,
    this.brandName,
    this.title = '',
    this.price = 0.0,
    this.variationId = '',
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(quantity: 0, productId: '');

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "price": price,
        "image": image,
        "quantity": quantity,
        "variationId": variationId,
        "brandName": brandName,
        "selectedVariation": selectedVariation,
      };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        productId: json['productId'],
        title: json['title'],
        price: json['price']?.toDouble(),
        image: json['image'],
        quantity: json['quantity'],
        variationId: json['variationId'],
        brandName: json['brandName'],
        selectedVariation:
            json['selectedVariation'] != null ? Map<String, String>.from(json['selectedVariation']) : null,
      );
}
