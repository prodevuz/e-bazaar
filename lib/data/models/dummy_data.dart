import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/features/shop/models/product_attribute_model.dart';
import 'package:ebazaar/features/shop/models/product_variation_model.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';

class ADDummyData {
  static final List<CategoryModel> categories = <CategoryModel>[
    CategoryModel(id: '1', name: "Sport", image: ADImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: "Mebel", image: ADImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: "Elektronika", image: ADImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: "Kiyimlar", image: ADImages.clothIcon, isFeatured: true),
    CategoryModel(id: '5', name: "Hayvonlar", image: ADImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: "Oyoqkiyimlar", image: ADImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: "Kosmetika", image: ADImages.cosmeticsIcon, isFeatured: true),

    /// Sub Categories
    // Sport
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),

    // Furniture
    CategoryModel(id: '11', name: "Sport krasovkalar", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '12', name: "Sport kiyimlar", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '13', name: "Sport jixozlari", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),

    // Electronics
    CategoryModel(id: '14', name: "Sport krasovkalar", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),
    CategoryModel(id: '15', name: "Sport kiyimlar", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),
    CategoryModel(id: '16', name: "Sport jixozlari", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),

    // Clothes
    CategoryModel(id: '17', name: "Sport krasovkalar", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),
    CategoryModel(id: '18', name: "Sport kiyimlar", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),
    CategoryModel(id: '19', name: "Sport jixozlari", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),

    // Animal
    CategoryModel(id: '20', name: "Sport krasovkalar", image: ADImages.animalIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '21', name: "Sport kiyimlar", image: ADImages.animalIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '22', name: "Sport jixozlari", image: ADImages.animalIcon, isFeatured: false, parentId: '5'),

    // Shoes
    CategoryModel(id: '23', name: "Sport krasovkalar", image: ADImages.shoeIcon, isFeatured: false, parentId: '6'),
    CategoryModel(id: '24', name: "Sport kiyimlar", image: ADImages.shoeIcon, isFeatured: false, parentId: '6'),
    CategoryModel(id: '25', name: "Sport jixozlari", image: ADImages.sportIcon, isFeatured: false, parentId: '6'),

    // Cosmetics
    CategoryModel(id: '26', name: "Sport krasovkalar", image: ADImages.cosmeticsIcon, isFeatured: false, parentId: '7'),
    CategoryModel(id: '27', name: "Sport kiyimlar", image: ADImages.cosmeticsIcon, isFeatured: false, parentId: '7'),
    CategoryModel(id: '28', name: "Sport jixozlari", image: ADImages.cosmeticsIcon, isFeatured: false, parentId: '7'),
  ];

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: ADImages.promoBanner1, targetScreen: "ADRoutes.order", active: true),
    BannerModel(imageUrl: ADImages.promoBanner2, targetScreen: "ADRoutes.order", active: true),
    BannerModel(imageUrl: ADImages.promoBanner3, targetScreen: "ADRoutes.order", active: true),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: "Yashil Nike sport krasovkasi",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: ADImages.productImage1,
      description: "Yashil Nike sport krasovkasi",
      brand: BrandModel(id: '1', image: ADImages.furnitureIcon, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [ADImages.productImage1, ADImages.productImage2, ADImages.productImage3, ADImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: "O'lcham", values: ['UZ 40', 'UZ 42', 'UZ 43']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage1,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 1",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 40'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 25,
          price: 140,
          salePrice: 125,
          image: ADImages.productImage2,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 2",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 42'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 17,
          price: 145,
          salePrice: 133,
          image: ADImages.productImage3,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 3",
          attributeValues: {'Rang': 'Black', "O'lcham": 'UZ 43'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 7,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage4,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 4",
          attributeValues: {'Rang': 'Red', "O'lcham": 'UZ 40'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: "Yashil Nike sport krasovkasi",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: ADImages.productImage1,
      description: "Yashil Nike sport krasovkasi",
      brand: BrandModel(id: '1', image: ADImages.furnitureIcon, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [ADImages.productImage1, ADImages.productImage2, ADImages.productImage3, ADImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: "O'lcham", values: ['UZ 40', 'UZ 42', 'UZ 43']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage1,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 1",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 40'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 25,
          price: 140,
          salePrice: 125,
          image: ADImages.productImage2,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 2",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 42'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 17,
          price: 145,
          salePrice: 133,
          image: ADImages.productImage3,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 3",
          attributeValues: {'Rang': 'Black', "O'lcham": 'UZ 43'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 7,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage4,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 4",
          attributeValues: {'Rang': 'Red', "O'lcham": 'UZ 40'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '003',
      title: "Yashil Nike sport krasovkasi",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: ADImages.productImage1,
      description: "Yashil Nike sport krasovkasi",
      brand: BrandModel(id: '1', image: ADImages.furnitureIcon, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [ADImages.productImage1, ADImages.productImage2, ADImages.productImage3, ADImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: "O'lcham", values: ['UZ 40', 'UZ 42', 'UZ 43']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage1,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 1",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 40'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 25,
          price: 140,
          salePrice: 125,
          image: ADImages.productImage2,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 2",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 42'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 17,
          price: 145,
          salePrice: 133,
          image: ADImages.productImage3,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 3",
          attributeValues: {'Rang': 'Black', "O'lcham": 'UZ 43'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 7,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage4,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 4",
          attributeValues: {'Rang': 'Red', "O'lcham": 'UZ 40'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '004',
      title: "Yashil Nike sport krasovkasi",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: ADImages.productImage1,
      description: "Yashil Nike sport krasovkasi",
      brand: BrandModel(id: '1', image: ADImages.furnitureIcon, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [ADImages.productImage1, ADImages.productImage2, ADImages.productImage3, ADImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: "O'lcham", values: ['UZ 40', 'UZ 42', 'UZ 43']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage1,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 1",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 40'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 25,
          price: 140,
          salePrice: 125,
          image: ADImages.productImage2,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 2",
          attributeValues: {'Rang': 'Green', "O'lcham": 'UZ 42'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 17,
          price: 145,
          salePrice: 133,
          image: ADImages.productImage3,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 3",
          attributeValues: {'Rang': 'Black', "O'lcham": 'UZ 43'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 7,
          price: 134,
          salePrice: 122.6,
          image: ADImages.productImage4,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif 4",
          attributeValues: {'Rang': 'Red', "O'lcham": 'UZ 40'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
