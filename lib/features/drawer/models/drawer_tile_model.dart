import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';

class DrawerTileModel {
  final String title;
  final String icon;

  const DrawerTileModel({
    required this.title,
    required this.icon,
  });
}

const List<DrawerTileModel> drawerTiles = [
  DrawerTileModel(
    title: ConstText.drawerMyProfile,
    icon: ConstImages.drawerMyProfile,
  ),
  DrawerTileModel(
    title: ConstText.drawerHome,
    icon: ConstImages.drawerHome,
  ),
  DrawerTileModel(
    title: ConstText.drawerChat,
    icon: ConstImages.drawerChat,
  ),
  DrawerTileModel(
    title: ConstText.drawerFavorites,
    icon: ConstImages.drawerFavorites,
  ),
  DrawerTileModel(
    title: ConstText.drawerNotification,
    icon: ConstImages.drawerNotification,
  ),
  DrawerTileModel(
    title: ConstText.drawerFilters,
    icon: ConstImages.drawerFilter,
  ),
  DrawerTileModel(
    title: ConstText.drawerAddEstate,
    icon: ConstImages.drawerAddEstate,
  ),
  DrawerTileModel(
    title: ConstText.drawerLanguage,
    icon: ConstImages.drawerLanguage,
  ),
  DrawerTileModel(
    title: ConstText.drawerLogout,
    icon: ConstImages.drawerLogout,
  ),
];
