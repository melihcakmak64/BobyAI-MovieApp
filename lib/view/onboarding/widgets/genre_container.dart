import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';

class GenreContainer extends StatelessWidget {
  final GenreModel genre;
  final bool isSelected;
  final VoidCallback onTap;

  const GenreContainer({
    super.key,
    required this.genre,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            height: 140.h,
            width: 140.w,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(
                color: isSelected ? Colors.red : Colors.transparent,
                width: 2.w,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              genre.name,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              bottom: 8.w,
              right: 8.w,
              child: Container(
                height: 32.w,
                width: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              ),
            ),
        ],
      ),
    );
  }
}
