import 'dart:math';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  final double appBarMaxHeight = 180.h;
  final double appBarMinHeight = 80.h;

  double appBarHeight = 0;
  double topPadding = 0;
  double progress = 0;
  double screenWidth = 0;

  final double drawerIconHeight = 45.h;
  double drawerIconTopOffset = 0;

  final double searchBarMaxHeight = 55.h;
  final double searchBarMinHeight = 45.h;
  double searchBarMaxWidth = 0;
  double searchBarMinWidth = 0;
  double searchBarHeight = 0;
  double searchBarWidth = 0;
  double searchBarTopOffset = 0;
  double searchBarLeftOffset = 16;

  final double titleMaxHeight = 80.h;
  final double titleMinHeight = 40.h;
  double titleScale = 1;
  double titleTopOffset = 0;
  double titleLeftOffset = 0;
  double titleOpacity = 0;



  void calculateOffsets(BuildContext context, double appBarHeight) {
    this.appBarHeight = appBarHeight;
    topPadding = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;

    // progress is 1 if appBarHeight is max
    progress = ((appBarHeight - appBarMinHeight) / (appBarMaxHeight - appBarMinHeight))
        .clamp(0.0, 1.0);

    searchBarMaxWidth = MediaQuery.of(context).size.width - 2 * searchBarLeftOffset;
    searchBarMinWidth = searchBarMaxWidth - drawerIconHeight;
    calculateDrawerIconOffsets();
    calculateSearchBarOffsets();
    calculateTitleOffsets();
  }

  double fix(double value, double lowerBound, double upperBound) {
    upperBound = max(upperBound, lowerBound);
    return value.clamp(lowerBound, upperBound);
  }

  void calculateDrawerIconOffsets() {
    double drawerIconLowerBound = topPadding + 20.h;
    double drawerIconUpperBound = topPadding + appBarHeight / 2 - drawerIconHeight - 10.h;
    drawerIconTopOffset = fix(
      topPadding + (appBarHeight - topPadding - drawerIconHeight) * progress,
      drawerIconLowerBound,
      drawerIconUpperBound,
    );
  }

  void calculateSearchBarOffsets() {
    final widthProgress = Curves.easeInCubic.transform(progress);

    searchBarHeight = searchBarMinHeight + (searchBarMaxHeight - searchBarMinHeight) * progress;
    searchBarWidth = searchBarMinWidth + (searchBarMaxWidth - searchBarMinWidth) * widthProgress;
    double searchBarTopOffsetLowerBound = topPadding + 20.h;
    double searchBarTopOffsetUpperBound = topPadding + appBarHeight - searchBarMaxHeight - 20.h;
    searchBarTopOffset = fix(
      topPadding + (appBarHeight - topPadding - searchBarMaxHeight) * progress,
      searchBarTopOffsetLowerBound,
      searchBarTopOffsetUpperBound,
    );

  }

  void calculateTitleOffsets() {
    titleOpacity = Curves.easeInCubic.transform(progress);
    titleScale = Curves.easeInCubic.transform(progress);

    double offsetBuffer = (((appBarHeight - appBarMinHeight) / (appBarMaxHeight - appBarMinHeight))) * 30.h;
    titleTopOffset = searchBarTopOffset - titleMaxHeight - offsetBuffer + 30.h;
    titleLeftOffset = 22 - Curves.easeIn.transform(1 - progress) * screenWidth;
  }
}
