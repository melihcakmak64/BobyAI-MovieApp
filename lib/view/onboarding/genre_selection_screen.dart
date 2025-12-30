import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/view/home/home_screen.dart';
import 'package:movie_app_task/view/onboarding/widgets/genre_container.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';

class GenreSelectionScreen extends StatefulWidget {
  final MovieViewModel viewModel;

  const GenreSelectionScreen({super.key, required this.viewModel});

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 38.h, 20.w, 0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(
                    builder: (_) {
                      final isCompleted = viewModel.selectedGenres.length == 2;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCompleted ? "Thank you 👍" : "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (!isCompleted) ...[
                            12.verticalSpace,
                            Text(
                              "Choose your 2 favorite genres",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                          54.verticalSpace,
                        ],
                      );
                    },
                  ),

                  // Grid Section
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        if (viewModel.genres.isEmpty || viewModel.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                mainAxisSpacing: 24.h,
                                crossAxisSpacing: 55.w,
                              ),
                          itemCount: viewModel.genres.length,
                          itemBuilder: (_, index) {
                            final genre = viewModel.genres[index];
                            return Observer(
                              builder: (_) => GenreContainer(
                                genre: genre,
                                isSelected: viewModel.selectedGenres.contains(
                                  genre,
                                ),
                                onTap: () => viewModel.toggleGenre(genre),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 45.h,
                left: 0,
                right: 0,
                child: Observer(
                  builder: (_) => CustomButton(
                    text: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(viewModel: viewModel),
                        ),
                      );
                    },
                    isDark: viewModel.selectedGenres.length < 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
