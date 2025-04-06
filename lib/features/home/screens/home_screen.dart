import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sakeny/features/home/screens/widget/custom_drawer.dart';
import 'package:sakeny/features/home/screens/widget/drawer_icon.dart';
import 'package:sakeny/features/home/screens/widget/search_bar_widget.dart';
import 'package:sakeny/features/home/screens/widget/title_widget.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';
import '../controllers/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      key: homeCubit.scaffoldKey,
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(18.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),

                  // title
                  TitleWidget(),

                  SizedBox(height: 30.h),

                  // Search bar
                  SearchBarWidget(),
                ],
              ),
            ),
            DrawerIcon(),
          ],
        ),
      ),
    );
  }
}

