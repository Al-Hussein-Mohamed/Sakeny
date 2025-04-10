import 'package:flutter/material.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/drawer/models/drawer_tile_model.dart';
import 'package:sakeny/features/drawer/screens/widgets/log_out_dialog.dart';
import 'package:sakeny/utils/constants/const_text.dart';

void Function() onTileTap(BuildContext context, DrawerTileModel drawerTile, String RouteName) {
  switch (drawerTile.title) {
    case ConstText.drawerMyProfile:
      return () {};

    case ConstText.drawerHome:
      return _homeOnTap(context, drawerTile, RouteName);

    case ConstText.drawerChat:
      return () => print("Chat");

    case ConstText.drawerFavorites:
      return () => print("Favorites");

    case ConstText.drawerNotification:
      return () {};

    case ConstText.drawerFilters:
      return () {};

    case ConstText.drawerAddEstate:
      return () {};

    case ConstText.drawerLanguage:
      return () {};

    case ConstText.drawerLogout:
      return _logoutOnTap(context, drawerTile, RouteName);

    default:
      return () {};
  }
}

void Function() _homeOnTap(BuildContext context, DrawerTileModel drawerTile, String RouteName) {
  if (RouteName == PageRouteNames.home) {
    return () => Navigator.pop(context);
  }
  return () => Navigator.pushReplacementNamed(context, PageRouteNames.home);
}

void Function() _logoutOnTap(BuildContext context, DrawerTileModel drawerTile, String RouteName) {
  return () async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return LogOutDialog();
      },
    );

    if (res == true) {
      Navigator.pushReplacementNamed(context, PageRouteNames.login);
    }
  };
}
