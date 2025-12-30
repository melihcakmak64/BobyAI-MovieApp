import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';

class CircleMovieContainer extends StatelessWidget {
  final MovieModel movie;

  const CircleMovieContainer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(500.r),
      child: ImageHelper.network(
        height: 80.w,
        width: 80.w,
        movie.posterPath,
        fit: BoxFit.fill,
      ),
    );
  }
}
