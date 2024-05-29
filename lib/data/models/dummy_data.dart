import 'package:ebazaar/utils/constants/image_strings.dart';
import 'package:ebazaar/features/shop/models/brand_model.dart';
import 'package:ebazaar/features/shop/models/banner_model.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/features/shop/models/category_model.dart';
import 'package:ebazaar/features/shop/models/brand_category_model.dart';
import 'package:ebazaar/features/shop/models/product_category_model.dart';
import 'package:ebazaar/features/shop/models/product_attribute_model.dart';
import 'package:ebazaar/features/shop/models/product_variation_model.dart';

class ADDummyData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: ADImages.promoBanner1, targetScreen: "ADRoutes.order", active: true),
    BannerModel(imageUrl: ADImages.promoBanner2, targetScreen: "ADRoutes.order", active: true),
    BannerModel(imageUrl: ADImages.promoBanner3, targetScreen: "ADRoutes.order", active: true),
  ];

  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: ADImages.cosco, name: 'Cosco', productsCount: 13, isFeatured: true),
    BrandModel(id: '2', image: ADImages.bellona, name: 'Bellona', productsCount: 19, isFeatured: true),
    BrandModel(id: '3', image: ADImages.apple, name: 'Apple', productsCount: 34, isFeatured: true),
    BrandModel(id: '4', image: ADImages.nike, name: 'Nike', productsCount: 27, isFeatured: true),
  ];

  static final List<BrandCategoryModel> brandCategories = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '2'),
    BrandCategoryModel(brandId: '3', categoryId: '3'),
    BrandCategoryModel(brandId: '4', categoryId: '4'),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: "Sport", image: ADImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: "Mebel", image: ADImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: "Elektronika", image: ADImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: "Kiyimlar", image: ADImages.clothIcon, isFeatured: true),

    /// Sub Categories
    // Sport
    CategoryModel(id: '8', name: "Sport krasovkalari", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '9', name: "Sport kiyimlari", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '10', name: "Sport jixozlari", image: ADImages.sportIcon, isFeatured: false, parentId: '1'),

    // Furniture
    CategoryModel(id: '11', name: "Ofis mebellari", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '12', name: "Uy mebellari", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '13', name: "Oshxona mebellari", image: ADImages.furnitureIcon, isFeatured: false, parentId: '2'),

    // Electronics
    CategoryModel(id: '14', name: "Smartfonlar", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),
    CategoryModel(id: '15', name: "Noutbuklar", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),
    CategoryModel(id: '16', name: "Aksessuarlar", image: ADImages.electronicsIcon, isFeatured: false, parentId: '3'),

    // Clothes
    CategoryModel(id: '17', name: "Erkaklar kiyimlari", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),
    CategoryModel(id: '18', name: "Ayollar kiyimlari", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),
    CategoryModel(id: '19', name: "Bolalar kiyimlari", image: ADImages.clothIcon, isFeatured: false, parentId: '4'),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: "Structure 25 | Erkaklar yugurish krasovkasi",
      stock: 18,
      price: 140,
      isFeatured: true,
      thumbnail: ADImages.productImage1,
      description:
          "Structure 25 sizga kerak bo'lgan joyda barqarorlik bilan, sizni xohlagan joyda yostiq bilan qoplaydi, Structure 25 sizni uzoq millarda, qisqa mashg'ulotlarda va hatto kun tugashidan oldin pastga va orqada qo'llab-quvvatlaydi. Bu siz izlayotgan barqarorlik, birinchi bog'lanishdanoq sodiq, sinab ko'rilgan va ishonchli, o'rta oyoq tizimi oldingidan ko'ra to'liq qo'llab-quvvatlovchi va qulayroq tamponlama.",
      brand: BrandModel(id: '4', image: ADImages.nike, name: 'Nike', productsCount: 27, isFeatured: true),
      images: [ADImages.productImage2, ADImages.productImage3, ADImages.productImage4, ADImages.productImage5, ADImages.productImage6, ADImages.productImage7, ADImages.productImage8],
      salePrice: 30,
      sku: 'HF4913',
      categoryId: '17',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Green', 'Black', 'Blue']),
        ProductAttributeModel(name: "O'lchamlar", values: ['6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '12.5', '13', '14', '15']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 6,
          price: 134,
          salePrice: 104,
          image: ADImages.productImage9,
          description: "Bu yashil Nike sport krasovkasi uchun tavsif",
          attributeValues: {'Rang': 'Green'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 3,
          price: 127,
          salePrice: 93,
          image: ADImages.productImage10,
          description: "Bu qora Nike sport krasovkasi uchun tavsif",
          attributeValues: {'Rang': 'Black'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 4,
          price: 119,
          salePrice: 92,
          image: ADImages.productImage11,
          description: "Bu ko'k Nike sport krasovkasi uchun tavsif",
          attributeValues: {'Rang': 'Blue'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 5,
          price: 143,
          salePrice: 123,
          image: ADImages.productImage12,
          description: "Bu oq Nike sport krasovkasi uchun tavsif",
          attributeValues: {'Rang': 'White'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: "iPhone 15 Pro Max",
      stock: 7,
      price: 1500,
      isFeatured: true,
      thumbnail: ADImages.productImage13,
      description: """Dizayn va qurish
Materiallar: iPhone 15 Pro Max nafis va yuqori sifatli dizaynga ega bo‘lib, ramka uchun aerokosmik titandan foydalaniladi, bu esa uni kuchli va engil qiladi.
Ranglar: U turli xil ranglarda mavjud, jumladan, telefonning nafis ko'rinishini yaxshilaydigan yangi qoplamalar.
Displey: Qurilma ProMotion texnologiyasiga ega ajoyib 6,7 dyuymli Super Retina XDR displeyga ega bo‘lib, silliq aylantirish va sezgir sensorli kirishlar uchun 120 Gts gacha moslashuvchan yangilanish tezligini taklif etadi. Displey jonli ranglar va chuqur qora ranglarni ta'minlab, HDR10 va Dolby Vision-ni qo'llab-quvvatlaydi.
Ishlash
Protsessor: Uning yadrosida A17 Bionic chipi joylashgan bo'lib, u bugungi kungacha Apple’ning eng kuchli va samarali protsessori hisoblanadi. A17 Bionic 6 yadroli protsessor, 6 yadroli GPU va 16 yadroli Neyron dvigateliga ega bo'lib, ajoyib ishlash va energiya samaradorligini ta'minlaydi.
Saqlash opsiyalari: U 128 Gb dan 1 TB gacha bo'lgan turli xil foydalanuvchi ehtiyojlarini qondiradigan bir nechta saqlash konfiguratsiyalarida keladi.
Kamera tizimi
Uch kamerali sozlash: iPhone 15 Pro Max ilg‘or uch kamerali tizim bilan jihozlangan, jumladan:
48 megapikselli keng sensor, yaxshilangan past yorug'lik ishlashi va ilg'or hisoblash fotografiya imkoniyatlari.
Kengroq sahnalarni suratga olish uchun kengroq ko'rish maydonini taklif qiluvchi 12 megapikselli ultra keng sensor.
5x optik zumga ega 12 megapikselli telefoto linza, yaqindan suratga olish uchun ajoyib ko'p qirralilikni ta'minlaydi.
ProRAW va ProRes: Bu xususiyatlar professional fotograflar va videograflarga yuqori sifatli tahrirlash imkonini berib, ularning mazmunini ko'proq nazorat qiladi.
LiDAR skaneri: kengaytirilgan haqiqat (AR) tajribasini yaxshilaydi va kam yorug'lik sharoitida avtofokusni yaxshilaydi.
Batareya va zaryadlash
Batareya muddati: iPhone 15 Pro Max kuchli batareya quvvatini taklif etadi, u og'ir foydalanishda to'liq kun davom etishi mumkin. Muayyan batareyaning ishlash muddati foydalanishga qarab o'zgaradi.
Zaryadlash: MagSafe simsiz zaryadlashni qo‘llab-quvvatlaydi, bu esa tez va qulay quvvatni oshirish imkonini beradi. Bundan tashqari, u simli ulanish orqali tez zaryadlash imkoniyatlarini o'z ichiga oladi.
Dasturiy ta'minot va xususiyatlar
iOS 17: Qurilma iOS 17-da ishlaydi, Apple’ning so‘nggi operatsion tizimi, kengaytirilgan maxfiylik boshqaruvi, qayta ishlab chiqilgan bildirishnomalar va yaxshilangan ko‘p vazifani bajarish imkoniyatlari kabi yangi xususiyatlarni o‘z ichiga oladi.
Ulanish: U tezroq ma'lumot olish uchun 5G ulanishini, shuningdek simsiz simsiz ishlashni yaxshilash uchun Wi-Fi 6E-ni qo'llab-quvvatlaydi.
Xavfsizlik: iPhone 15 Pro Max xavfsiz autentifikatsiya va Apple Pay tranzaksiyalari uchun Face ID, Apple kompaniyasining yuzni tanish texnologiyasini o'z ichiga oladi.
Boshqa xususiyatlar
Chidamlilik: iPhone 15 Pro Max yuqori darajada chidamli boʻlib ishlab chiqilgan boʻlib, qoʻshimcha ekran himoyasi uchun Ceramic Shield old qopqogʻi va yaxshilangan suv va changga chidamliligi (IP68 reytingi).
Audio: U immersiv ovoz tajribasi uchun yuqori sifatli stereo dinamiklar va fazoviy audio qo'llab-quvvatlashni taklif etadi.""",
      brand: BrandModel(id: '3', image: ADImages.apple, name: 'Apple', productsCount: 34, isFeatured: true),
      images: [ADImages.productImage14, ADImages.productImage15, ADImages.productImage16],
      salePrice: 50,
      sku: 'PMX1551',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Rang', values: ['Black', 'White', 'Blue']),
        ProductAttributeModel(name: "Xotira", values: ['256 GB', '512 GB', '1 TB']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 2,
          price: 1340,
          salePrice: 1250,
          image: ADImages.productImage17,
          description: "Bu qora iPhone 15 Pro Max uchun tavsif",
          attributeValues: {'Rang': 'Black', 'Xotira': '256 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 1,
          price: 1400,
          salePrice: 1350,
          image: ADImages.productImage18,
          description: "Bu oq iPhone 15 Pro Max uchun tavsif",
          attributeValues: {'Rang': 'White', 'Xotira': '512 GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 4,
          price: 1500,
          salePrice: 1450,
          image: ADImages.productImage19,
          description: "Bu ko'k iPhone 15 Pro Max uchun tavsif",
          attributeValues: {'Rang': 'Blue', "Xotira": '1 TB'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '003',
      title: "Nautilus Westminster bog'langan teri boshqaruvchi kafedrasi",
      stock: 3,
      price: 130,
      isFeatured: true,
      thumbnail: ADImages.productImage20,
      description:
          """Haqiqatan ham zamonaviy klassik, bu baland orqa boshqaruvchilar kreslosi zamonaviy va zamonaviy estetikani hamda boy xususiyatlar ro'yxatini taqdim etadi - professional va uy foydalanuvchilari uchun ideal. O‘rindiq va orqa o‘rindiqning bir-biriga mos ravishda mutanosib bo‘lgan bosh suyagi va talaffuz qilingan bel tayanchi zamonaviy tarzda tikilgan va teridan tikilgan qoplama bilan bezatilgan. Kreslo mexanizmi foydalanuvchiga stulni toʻliq yonboshlab qoʻyish imkonini beradi – individual tana vazniga qarab sozlanishi (taranglikni nazorat qilish), uni tik holatda qulflash mumkin va mustahkam gazli lift orqali oʻrindiq balandligini oson sozlash imkonini beradi. Zamonaviy xromli qo'llar, mos keladigan yostiqli va yumshoq qo'l yostiqlari bilan to'ldiruvchi sayqallangan xrom tagliklari ushbu mashhur jihozni to'ldiradi.""",
      brand: BrandModel(id: '2', image: ADImages.bellona, name: 'Bellona', productsCount: 19, isFeatured: true),
      images: [ADImages.productImage14, ADImages.productImage5, ADImages.productImage16, ADImages.productImage17, ADImages.productImage18, ADImages.productImage19],
      salePrice: 100,
      sku: 'ARMC734',
      categoryId: '11',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: "Xterra o'zgaruvchan gantellari",
      stock: 1,
      price: 200,
      isFeatured: true,
      thumbnail: ADImages.productImage25,
      description: """Xususiyatlari:
Gantel beshigida bir qo'lda tutqichli burama vaznini tanlash
Og'irligi funt. O'sish (5/10/15/20/25 yoki 11/22/33/44/55)
Olti burchakli Plitalar aylanishdan saqlaydi
Xavfsiz va qulay foydalanish uchun o'ralgan va konturli tijorat uslubidagi tutqich
Ixtiyoriy XTERRA sozlanishi gantel stend""",
      brand: BrandModel(id: '1', image: ADImages.bellona, name: 'Cosco', productsCount: 19, isFeatured: true),
      images: [ADImages.productImage26],
      sku: 'DMBL23',
      categoryId: '10',
      productType: 'ProductType.single',
    ),
  ];

  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '17'),
    ProductCategoryModel(productId: '002', categoryId: '14'),
    ProductCategoryModel(productId: '003', categoryId: '11'),
    ProductCategoryModel(productId: '004', categoryId: '10'),
  ];
}
