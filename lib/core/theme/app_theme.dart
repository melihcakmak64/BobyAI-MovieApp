import 'package:flutter/material.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  fontFamily: "Inter",
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
  ).apply(bodyColor: Colors.white, displayColor: Colors.white),
);
