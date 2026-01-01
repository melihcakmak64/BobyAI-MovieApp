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
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: AppColors.white,
    displayColor: AppColors.white,
  ),
);
