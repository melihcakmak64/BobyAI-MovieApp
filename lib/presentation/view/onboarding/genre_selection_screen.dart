import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/presentation/view/onboarding/widgets/genre_container.dart';
import 'package:movie_app_task/presentation/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

@RoutePage()
class GenreSelectionScreen extends StatefulWidget {
  const GenreSelectionScreen({super.key});

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  final MovieViewModel viewModel = GetIt.I<MovieViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
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
                      return ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 65.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isCompleted ? "Thank you 👍" : "Welcome",
                              style: TextStyles.font24Bold,
                            ),
                            12.verticalSpace,
                            Text(
                              isCompleted
                                  ? ""
                                  : "Choose your 2 favorite genres",
                              style: TextStyles.font20Medium,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  38.verticalSpace,

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
                          padding: EdgeInsets.only(bottom: 120.h, top: 34.h),
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
                  builder: (_) {
                    final selectionCompleted =
                        viewModel.selectedGenres.length == 2;
                    return CustomButton(
                      text: "Continue",
                      onPressed: () {
                        if (selectionCompleted) {
                          context.router.push(PaywallRoute());
                        }
                      },
                      isActive: selectionCompleted,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
