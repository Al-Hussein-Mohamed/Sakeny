import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../utils/constants/const_images.dart";
import "../../models/drawer_tile_model.dart";
import "custom_drawer_header.dart";
import "drawer_list_tile.dart";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .85,
        margin: EdgeInsets.only(top: 20.h, bottom: 80.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(ConstImages.drawerClose),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomDrawerHeader(),
            SizedBox(height: 20.h),
            Expanded(
              child: Column(
                children: drawerTiles.map((e) => Expanded(child: DrawerListTile(drawerTile: e)),).toList(),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: drawerTiles.length,
            //     itemBuilder: (context, index) => DrawerListTile(drawerTile: drawerTiles[index]),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
