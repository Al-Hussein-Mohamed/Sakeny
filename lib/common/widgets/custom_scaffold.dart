import 'package:flutter/material.dart';
import 'package:sakeny/common/widgets/custom_app_bar.dart';
import 'package:sakeny/features/drawer/screens/custom_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Key? scaffoldKey;
  final Widget body;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.scaffoldKey,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const CustomDrawer(),
        endDrawerEnableOpenDragGesture: false,
        appBar: appBar ??
            AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor, toolbarHeight: 0),
        body: body,
      ),
    );
  }
}
