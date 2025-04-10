import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/core/services/service_locator.dart';
import 'package:sakeny/core/settings_provider.dart';
import 'package:sakeny/features/onboarding/screens/onboarding_screen.dart';
import 'package:sakeny/utils/helpers/herlpers.dart';
import 'package:sakeny/utils/observers/bloc_observer.dart';
import 'package:sakeny/utils/theme/theme.dart';

import 'core/routing/page_route_name.dart';
import 'core/routing/page_router.dart';
import 'core/services/loading_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  serviceLocatorSetup();
  Bloc.observer = MyBlocObserver();

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (cont, child) {
        loadAssets(cont);
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
    configjEasyLoading(settingsProvider.isDarkMode);

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
      builder: EasyLoading.init(),
    );
  }
}
