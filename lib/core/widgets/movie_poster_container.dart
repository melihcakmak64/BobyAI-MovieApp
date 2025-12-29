import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';

class MoviePosterContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final String imagePath;
  final VoidCallback onTap;
  const MoviePosterContainer({
    super.key,
    this.height,
    this.width,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ImageHelper.network(
        height: height ?? 252.h,
        imagePath,
        width: width ?? 180.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
