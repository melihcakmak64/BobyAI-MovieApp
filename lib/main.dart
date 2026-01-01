import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/app_starter.dart';
import 'package:movie_app_task/core/di/get_it.dart';
import 'package:movie_app_task/core/theme/app_theme.dart';
import 'package:movie_app_task/routes/app_router.dart';

Future<void> main() async {
  await AppStarter.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
