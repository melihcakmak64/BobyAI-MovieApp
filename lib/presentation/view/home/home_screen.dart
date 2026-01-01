import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';
import 'package:movie_app_task/presentation/view/home/widgets/circle_movie_container.dart';
import 'package:movie_app_task/presentation/view/home/widgets/movie_category_scroller.dart';
import 'package:movie_app_task/presentation/viewmodel/home_view_model.dart';
import 'package:movie_app_task/presentation/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieViewModel movieViewModel = GetIt.I<MovieViewModel>();
  final HomeViewModel homeViewModel = GetIt.I<HomeViewModel>();
  int activeGenreIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await homeViewModel.fetchHomeData(
      allGenres: movieViewModel.genres,
      selectedGenres: movieViewModel.selectedGenres,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            // Loading State
            if (homeViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error State
            if (homeViewModel.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error is occured!!', style: TextStyles.font18Medium),
                    8.verticalSpace,
                    Text(
                      homeViewModel.errorMessage!,
                      style: TextStyles.font14Regular.copyWith(
                        color: AppColors.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    16.verticalSpace,
                    ElevatedButton(
                      onPressed: _initializeData,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                _buildHeader(),
                Divider(height: 1.h, color: Colors.grey),
                16.verticalSpace,
                _buildMoviesSection(),
                12.verticalSpace,

                Expanded(
                  child: MovieCategoryScroller(
                    moviesByGenre: homeViewModel.moviesByGenre,
                    genres: movieViewModel.genres,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 26.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("For You ⭐", style: TextStyles.font24Bold),
          20.verticalSpace,
          SizedBox(
            height: 80.h,
            child: homeViewModel.recommendedMovies.isEmpty
                ? Center(
                    child: Text(
                      'Movie not found',
                      style: TextStyles.font14Regular,
                    ),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeViewModel.recommendedMovies.length,
                    separatorBuilder: (_, __) => 20.horizontalSpace,
                    itemBuilder: (_, index) {
                      final movie = homeViewModel.recommendedMovies[index];
                      return CircleMovieContainer(movie: movie);
                    },
                  ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  // ---------------- Movies - Search Section ----------------

  Widget _buildMoviesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text("Movies 🎬", style: TextStyles.font24Bold),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: _SearchBar(),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(SearchRoute()),
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.grayDark),
            6.horizontalSpace,
            Expanded(
              child: Text(
                "Search",
                style: TextStyles.font17Regular.copyWith(
                  color: AppColors.grayDark,
                ),
              ),
            ),
            Icon(Icons.mic, color: AppColors.grayDark),
          ],
        ),
      ),
    );
  }
}
