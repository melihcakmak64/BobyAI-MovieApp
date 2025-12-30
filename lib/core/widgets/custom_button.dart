import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDark;
  final IconData? trailingIcon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDark = true,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isDark ? AppColors.redDark : AppColors.redLight,
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: isDark ? AppColors.gray : AppColors.white,
            ),
          ),
          if (trailingIcon != null)
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                trailingIcon,
                color: isDark ? AppColors.gray : AppColors.white,
                size: 24.sp,
              ),
            ),
        ],
      ),
    );
  }
}
