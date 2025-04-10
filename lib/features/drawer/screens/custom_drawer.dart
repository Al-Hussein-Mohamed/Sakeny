import "package:animated_theme_switcher/animated_theme_switcher.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:provider/provider.dart";
import "package:sakeny/core/routing/page_route_name.dart";
import "package:sakeny/features/drawer/controllers/on_tile_tap.dart";
import "package:sakeny/features/drawer/screens/widgets/custom_theme_mode_button.dart";
import "package:sakeny/utils/constants/const_text.dart";

import "../../../core/settings_provider.dart";
import "../../../utils/constants/const_images.dart";
import "../models/drawer_tile_model.dart";
import "widgets/custom_drawer_header.dart";
import "widgets/drawer_list_tile.dart";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .82,
        height: MediaQuery.of(context).size.height * .85,
        // margin: EdgeInsets.only(top: 20.h, bottom: 80.h),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(ConstImages.drawerClose),
                  ),
                  const CustomThemeModeButton(),
                ],
              ),
            ),
            const CustomDrawerHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: drawerTiles
                    .map(
                      (e) => Expanded(
                        child: DrawerListTile(
                          drawerTile: e,
                          onTap: onTileTap(
                            context,
                            e,
                            ModalRoute.of(context)?.settings.name ?? "",
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
