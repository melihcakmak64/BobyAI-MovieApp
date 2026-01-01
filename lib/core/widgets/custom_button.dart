import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final IconData? trailingIcon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? AppColors.redLight : AppColors.redDark,
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
            style: TextStyles.font16SemiBold.copyWith(
              color: isActive ? AppColors.white : AppColors.gray,
            ),
          ),
          if (trailingIcon != null)
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                trailingIcon,
                color: isActive ? AppColors.white : AppColors.gray,
                size: 24.sp,
              ),
            ),
        ],
      ),
    );
  }
}
