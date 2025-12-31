import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';

class MoviePosterContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  const MoviePosterContainer({
    super.key,
    this.height,
    this.width,
    required this.onTap,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: ImageHelper.network(
              imagePath,
              height: height ?? 252.h,
              width: width ?? 180.w,
              fit: BoxFit.fill,
            ),
          ),

          if (isSelected)
            Positioned(
              right: 16.w,
              bottom: 7.h,
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }
}
