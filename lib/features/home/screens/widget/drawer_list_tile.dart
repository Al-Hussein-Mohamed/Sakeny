import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/drawer_tile_model.dart';

class DrawerListTile extends StatelessWidget {
  final DrawerTileModel drawerTile;

  const DrawerListTile({
    super.key,
    required this.drawerTile,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 8),
      visualDensity: VisualDensity(vertical: -3), // Smaller height
      minVerticalPadding: 0, // Minimum internal vertical padding

      leading: SvgPicture.asset(drawerTile.icon),
      title: Text(
        drawerTile.title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
