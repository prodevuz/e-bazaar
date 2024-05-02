import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';
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
}
