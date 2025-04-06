import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/core/services/service_locator.dart';
import 'package:sakeny/features/onboarding/screens/onboarding_screen.dart';
import 'package:sakeny/utils/theme/theme.dart';

import 'core/config/page_route_name.dart';
import 'core/config/page_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // or a visible color
      statusBarIconBrightness: Brightness.dark, // or Brightness.light
    ),
  );

  await ScreenUtil.ensureScreenSize();

  serviceLocatorSetup();
  // if (kDebugMode) {
  //   runApp(
  //     DevicePreview(
  //       enabled: true,
  //       builder: (context) => const Sakeny(),
  //     ),
  //   );
  // } else {
  //   runApp(const Sakeny());
  // }
  runApp(const Sakeny());
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return MaterialApp(
          title: 'Sakeny',
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.system,
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: PageRouteNames.onboarding,
          onGenerateRoute: PageRouter.onGenerateRoute,
        );
      },
    );

  }
}
