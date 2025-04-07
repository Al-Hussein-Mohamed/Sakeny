import 'dart:math';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/utils/constants/const_images.dart';

import '../../../../core/settings_provider.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/theme/theme.dart';

class ThemeModeCustomButton extends StatefulWidget {
  const ThemeModeCustomButton({super.key});

  @override
  State<ThemeModeCustomButton> createState() => _ThemeModeCustomButtonState();
}

class _ThemeModeCustomButtonState extends State<ThemeModeCustomButton> {
  int isDarkMode = 0;

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    isDarkMode = settingsProvider.isDarkMode ? 1 : 0;

    return Transform.scale(
      scale: 0.88,
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AnimatedToggleSwitch<int>.rolling(
          indicatorIconScale: 1.1,
          animationDuration: Duration(milliseconds: 400),
          iconOpacity: 1.0,
          borderWidth: 4,
          height: 50,
          spacing: 2,
          loading: false,
          current: isDarkMode,
          values: const [0, 1],
          onChanged: (i) {
            setState(() => isDarkMode = i);
            settingsProvider.toggleTheme(isDarkMode);
          },
          style: ToggleStyle(
            indicatorBoxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1.5, 1.5))
            ],
            indicatorColor: isDarkMode == 0 ? Color(0xFFFBBC04) : Color(0xFF3D555D),
            backgroundColor: isDarkMode == 0 ? Colors.white : Color(0xFF253439),
            borderColor: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, spreadRadius: 1, blurRadius: 2, offset: Offset(0, 1.5))
            ],
          ),
          iconBuilder: (value, _) {
            return value == 0
                ? SvgPicture.asset(
                    ConstImages.drawerSun,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(
                      isDarkMode == 0 ? Color(0xFFECEE60) : Color(0xFFFBBC04),
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(
                    ConstImages.drawerMoon,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(Color(0xFF253439), BlendMode.srcIn),
                  );
          },
        ),
      ),
    );
  }
}
