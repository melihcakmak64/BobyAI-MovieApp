import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/widgets/movie_poster_container.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';

class GenreSection extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const GenreSection({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20.sp)),
        12.verticalSpace,
        SizedBox(
          height: 176,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (_, __) => 21.5.horizontalSpace,
            itemBuilder: (_, index) {
              return MoviePosterContainer(
                height: 140.h,
                width: 100.w,
                onTap: () {},
                imagePath: movies[index].posterPath,
              );
            },
          ),
        ),
      ],
    );
  }
}

