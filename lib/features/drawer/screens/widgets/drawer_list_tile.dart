import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/settings_provider.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../models/drawer_tile_model.dart';

class DrawerListTile extends StatelessWidget {
  final DrawerTileModel drawerTile;
  final void Function()? onTap;

  const DrawerListTile({
    super.key,
    required this.drawerTile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListTile(
                tileColor: Colors.transparent,
                contentPadding: EdgeInsets.only(left: 8),
                visualDensity: VisualDensity(vertical: -3),
                minVerticalPadding: 0,
                leading: SvgPicture.asset(
                  drawerTile.icon,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  drawerTile.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
