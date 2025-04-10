import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/features/home/controllers/home_cubit.dart';
import 'package:sakeny/features/home/screens/widget/drawer_icon.dart';
import 'package:sakeny/features/home/screens/widget/search_bar_widget.dart';
import 'package:sakeny/features/home/screens/widget/title_widget.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  double fix(double value, double lowerBound, double upperBound) {
    upperBound = max(upperBound, lowerBound);
    return value.clamp(lowerBound, upperBound);
  }

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: homeCubit.appBarMaxHeight,
      collapsedHeight: homeCubit.appBarMinHeight,
      pinned: true,
      automaticallyImplyLeading: false,
      stretch: true,
      onStretchTrigger: () async {},
      actions: [SizedBox.shrink()],
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18.r),
          bottomRight: Radius.circular(18.r),
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          homeCubit.calculateOffsets(context, constraints.biggest.height);
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    // color: theme.scaffoldBackgroundColor.withAlpha(188),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.scaffoldBackgroundColor.withAlpha(255),
                        theme.scaffoldBackgroundColor.withAlpha(255),
                        theme.scaffoldBackgroundColor.withAlpha(255),
                        theme.scaffoldBackgroundColor.withAlpha(255),
                        theme.scaffoldBackgroundColor.withAlpha(255),

                        theme.scaffoldBackgroundColor.withAlpha(120),
                        theme.scaffoldBackgroundColor.withAlpha(80),

                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18.r),
                      bottomRight: Radius.circular(18.r),
                    ),
                  ),
                ),
              ),
              SearchBarWidget(),
              TitleWidget(),
              DrawerIcon(),
            ],
          );
        },
      ),
    );
  }
}
