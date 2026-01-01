import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/constants/image_paths.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';
import 'package:movie_app_task/presentation/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final MovieViewModel viewModel = GetIt.I<MovieViewModel>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await viewModel.fetchMovies();

    if (!mounted) return;

    context.router.replace(MovieSelectionRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageHelper.asset(AImage.appIcon, height: 166.w, width: 166.w),
            Text("MovieAI", style: TextStyles.font24Bold),
          ],
        ),
      ),
    );
  }
}
