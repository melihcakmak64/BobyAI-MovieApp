import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/constants/image_paths.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/view/onboarding/movie_selection_screen.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';

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

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => FavoriteMoviesSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(child: ImageHelper.asset(AImage.appIcon)),
    );
  }
}
