import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/custom_scaffold.dart';
import 'package:sakeny/features/drawer/screens/custom_drawer.dart';
import 'package:sakeny/features/home/screens/widget/custom_sliver_app_bar.dart';
import 'package:sakeny/features/home/screens/widget/drawer_icon.dart';
import 'package:sakeny/features/home/screens/widget/search_bar_widget.dart';
import 'package:sakeny/features/home/screens/widget/title_widget.dart';
import 'package:sakeny/utils/constants/const_colors.dart';

import '../controllers/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return CustomPopScope(
      child: CustomScaffold(
        scaffoldKey: homeCubit.scaffoldKey,
        body: SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          setState(() {});
        }
        return false;
      },
      child: CustomScrollView(
        controller: homeCubit.scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return DummyContainer(index: index);
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class DummyContainer extends StatelessWidget {
  final int index;
  const DummyContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ConstColors.primaryColor.withAlpha(((index % 5) * 100 + 100)%256),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}

