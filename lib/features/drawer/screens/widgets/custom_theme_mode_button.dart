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

class CustomThemeModeButton extends StatefulWidget {
  const CustomThemeModeButton({super.key});

  @override
  State<CustomThemeModeButton> createState() => _CustomThemeModeButtonState();
}

class _CustomThemeModeButtonState extends State<CustomThemeModeButton> {
  int isDarkMode = 0;

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final theme = Theme.of(context);
    isDarkMode = settingsProvider.isDarkMode ? 1 : 0;

    return Transform.scale(
      scale: 0.75,
      alignment: Alignment.centerRight,
      child: Material(
        elevation: 5,
        color: theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          child: AnimatedToggleSwitch<int>.rolling(
            animationCurve: Curves.linear,
            animationDuration: Duration(milliseconds: 450),

            indicatorIconScale: 1.1,
            iconOpacity: 1.0,
            borderWidth: 4,
            height: 55,
            spacing: 4,
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
              backgroundColor: Colors.transparent,
              borderColor: Colors.transparent,
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
      ),
    );
  }
}