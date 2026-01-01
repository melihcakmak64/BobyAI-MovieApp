import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';

class GenreChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const GenreChip({super.key, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.5.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.redLight : AppColors.gray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isActive) ...[
            Icon(Icons.check, size: 16.w, color: AppColors.white),
          ],
          Text(
            label,
            style: TextStyles.font16Regular.copyWith(
              color: isActive ? AppColors.white : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
