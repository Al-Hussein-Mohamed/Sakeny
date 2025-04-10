import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/core/routing/page_route_name.dart';

import '../../../../utils/constants/const_images.dart';
import '../../../../utils/constants/const_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Set<String> blackList = {
      PageRouteNames.home,
    };
    return Hero(
      tag: blackList.contains(ModalRoute.of(context)?.settings.name) ? "asdf" : "img",
      child: Container(
        height: 90.h,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ConstText.homeTitle1,
                  style: theme.textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                ),
                Image.asset(ConstImages.loginLogo, scale: 3),
              ],
            ),
            SizedBox(height: 2),
            Text(
              ConstText.homeTitle2,
              style: theme.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
