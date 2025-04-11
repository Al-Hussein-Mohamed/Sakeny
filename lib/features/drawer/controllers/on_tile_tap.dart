import 'package:flutter/material.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/drawer/models/drawer_tile_model.dart';
import 'package:sakeny/features/drawer/screens/widgets/log_out_dialog.dart';
import 'package:sakeny/utils/constants/const_text.dart';

void Function() onTileTap(BuildContext context, DrawerTileModel drawerTile, String routeName) {
  return () {
    // close the drawer
    Navigator.pop(context);

    // tile tap action
    tileTapAction(context, drawerTile, routeName);
  };
}

void tileTapAction(BuildContext context, DrawerTileModel drawerTile, String routeName) {
  switch (drawerTile.title) {
    case ConstText.drawerMyProfile:
      break;

    case ConstText.drawerHome:
      _homeOnTap(context, drawerTile, routeName);
      break;

    case ConstText.drawerChat:
      break;

    case ConstText.drawerFavorites:
      break;

    case ConstText.drawerNotification:
      break;

    case ConstText.drawerFilters:
      break;

    case ConstText.drawerAddEstate:
      break;

    case ConstText.drawerLanguage:
      break;

    case ConstText.drawerLogout:
      _logoutOnTap(context, drawerTile, routeName);
      break;

    default:
  }
}

void _homeOnTap(BuildContext context, DrawerTileModel drawerTile, String routeName) {
  if (routeName == PageRouteNames.home) return;

  Navigator.pushReplacementNamed(context, PageRouteNames.home);
}

void _logoutOnTap(BuildContext context, DrawerTileModel drawerTile, String routeName) async {

  final navigator = Navigator.of(context);

  final res = await showDialog(
    context: context,
    builder: (context) => LogOutDialog(),
  );

  if (res == true) {
    navigator.pushNamedAndRemoveUntil(
      PageRouteNames.login,
          (route) => false,
    );
  }
}
