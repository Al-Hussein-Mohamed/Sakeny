import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakeny/features/drawer/screens/custom_drawer.dart';
import 'package:sakeny/utils/constants/const_images.dart';
import 'package:sakeny/utils/constants/dist.dart';

class CustomScaffold extends StatelessWidget {
  static final _drawerIcon = SvgPicture.asset(
    ConstImages.drawerIcon,
    width: Dist.iconSize,
    height: Dist.iconSize,
  );
  final String? screenTitle;
  final VoidCallback? openDrawer;
  final VoidCallback? onBack;
  final Key? scaffoldKey;
  final Widget body;

  const CustomScaffold({
    super.key,
    this.scaffoldKey,
    required this.body,
    this.screenTitle,
    this.openDrawer,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    print("CustomScaffold build");
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const CustomDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: body,
        appBar: screenTitle == null
            ? null
            : AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: onBack,
                ),
                title: Text(screenTitle!),
                actions: [
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: openDrawer,
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: _drawerIcon,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
