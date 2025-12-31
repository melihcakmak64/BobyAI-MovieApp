import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';
import 'package:movie_app_task/presentation/view/home/widgets/genre_chip.dart';
import 'package:movie_app_task/presentation/view/home/widgets/genre_section.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class MovieCategoryScroller extends StatelessWidget {
  final Map<int, List<MovieModel>> moviesByGenre;
  final List<GenreModel> genres;

  const MovieCategoryScroller({
    Key? key,
    required this.moviesByGenre,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreIds = moviesByGenre.keys.toList();

    return ScrollableListTabScroller.defaultComponents(
      headerContainerProps: HeaderContainerProps(height: 32.h),
      tabBarProps: TabBarProps(
        dividerHeight: 0,
        padding: EdgeInsets.only(left: 20.w),
        labelPadding: EdgeInsets.only(right: 12.w),
      ),
      itemCount: genreIds.length,
      earlyChangePositionOffset: 30,
      tabBuilder: (context, index, active) {
        final genre = genres.firstWhere((e) => e.id == genreIds[index]);
        return GenreChip(label: genre.name, isActive: active);
      },
      itemBuilder: (context, index) {
        final genre = genres.firstWhere((e) => e.id == genreIds[index]);
        final movies = moviesByGenre[genre.id] ?? [];

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ).copyWith(top: index == 0 ? 24.h : 0),
          child: GenreSection(title: genre.name, movies: movies),
        );
      },
    );
  }
}
