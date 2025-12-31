import 'package:flutter/material.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(15, 14, 14, 1),
  fontFamily: "Inter",
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      return AppColors.white;
    }),

    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.green;
      }
      return AppColors.grayDark;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.green;
      }
      return AppColors.grayDark;
    }),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
  ).apply(bodyColor: Colors.white, displayColor: Colors.white),
);
