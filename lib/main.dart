import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/core/services/service_locator.dart';
import 'package:sakeny/core/settings_provider.dart';
import 'package:sakeny/features/onboarding/screens/onboarding_screen.dart';
import 'package:sakeny/utils/theme/theme.dart';

import 'core/config/page_route_name.dart';
import 'core/config/page_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await ScreenUtil.ensureScreenSize();

  serviceLocatorSetup();

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
          child: Sakeny(),
        );
      },
    ),
  );
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Sakeny',
      debugShowCheckedModeBanner: false,
      theme: settingsProvider.themeData,
      initialRoute: PageRouteNames.onboarding,
      onGenerateRoute: PageRouter.onGenerateRoute,
    );
  }
}