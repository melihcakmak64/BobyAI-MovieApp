import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';
import 'package:movie_app_task/core/widgets/movie_poster_container.dart';
import 'package:movie_app_task/presentation/viewmodel/home_view_model.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HomeViewModel homeViewModel = GetIt.I<HomeViewModel>();

  @override
  void dispose() {
    homeViewModel.resetSearch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search movies...",
            hintStyle: TextStyle(color: AppColors.white),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            homeViewModel.setSearchQuery(value);
          },
        ),
        backgroundColor: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      backgroundColor: AppColors.black,
      body: Observer(
        builder: (_) {
          if (homeViewModel.isSearching) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          final results = homeViewModel.searchResults;
          final query = homeViewModel.searchQuery ?? "";

          if (query.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 64.sp, color: AppColors.gray),
                  16.verticalSpace,
                  Text(
                    "Search for movies",
                    style: TextStyles.font16SemiBold.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            );
          }

          if (results.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie_filter, size: 64.sp, color: Colors.grey),
                  16.verticalSpace,
                  Text("No results found", style: TextStyles.font18Bold),
                  8.verticalSpace,
                  Text(
                    "Try a different search term",
                    style: TextStyles.font14Regular,
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: results.length,
            itemBuilder: (_, index) {
              final movie = results[index];
              return MoviePosterContainer(imagePath: movie.posterPath);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120.w,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.w,
              childAspectRatio: 100 / 140,
            ),
          );
        },
      ),
    );
  }
}
