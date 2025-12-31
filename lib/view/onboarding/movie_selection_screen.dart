import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/view/onboarding/widgets/curved_horizontal_list.dart';
import 'package:movie_app_task/view/onboarding/genre_selection_screen.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';

class FavoriteMoviesSelectionScreen extends StatelessWidget {
  FavoriteMoviesSelectionScreen({super.key});
  final MovieViewModel viewModel = GetIt.I<MovieViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    "Choose your 3 favorite movies",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  24.verticalSpace,
                  Expanded(
                    child: CurvedHorizontalList(
                      movies: viewModel.movies,
                      viewModel: viewModel,
                    ),
                  ),
                  Observer(
                    builder: (_) => CustomButton(
                      text: "Continue",
                      isDark: viewModel.selectedMovies.length < 3,
                      onPressed: viewModel.selectedMovies.length == 3
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => GenreSelectionScreen(),
                                ),
                              );
                            }
                          : () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
