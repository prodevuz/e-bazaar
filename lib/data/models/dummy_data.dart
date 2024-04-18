import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';

class ADDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: "Sport", image: ADImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: "Mebel", image: ADImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: "Elektronika", image: ADImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: "Kiyimlar", image: ADImages.clothIcon, isFeatured: true),
    CategoryModel(id: '5', name: "Hayvonlar", image: ADImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: "Oyoqkiyimlar", image: ADImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: "Kosmetika", image: ADImages.cosmeticsIcon, isFeatured: true),

    /// Sub Categories
    // Sport
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.sportIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.sportIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.sportIcon, isFeatured: false),

    // Furniture
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.furnitureIcon, isFeatured: false),

    // Electronics
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.electronicsIcon, isFeatured: false),

    // Clothes
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.clothIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.clothIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.clothIcon, isFeatured: false),

    // Animal
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.animalIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.animalIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.animalIcon, isFeatured: false),

    // Shoes
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.shoeIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.shoeIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.sportIcon, isFeatured: false),

    // Cosmetics
    CategoryModel(id: '8', name: "Sport krasovkalar", image: ADImages.cosmeticsIcon, isFeatured: false),
    CategoryModel(id: '9', name: "Sport kiyimlar", image: ADImages.cosmeticsIcon, isFeatured: false),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.cosmeticsIcon, isFeatured: false),
  ];
}
