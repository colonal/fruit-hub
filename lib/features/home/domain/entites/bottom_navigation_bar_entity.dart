import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        activeImage: Assets.imagesHomeActive,
        inActiveImage: Assets.imagesHome,
        name: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesProductsActive,
        inActiveImage: Assets.imagesProducts,
        name: 'المنتجات',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesShoppingCartActive,
        inActiveImage: Assets.imagesShoppingCart,
        name: 'سلة التسوق',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.imagesUserActive,
        inActiveImage: Assets.imagesUser,
        name: 'حسابي',
      ),
    ];
