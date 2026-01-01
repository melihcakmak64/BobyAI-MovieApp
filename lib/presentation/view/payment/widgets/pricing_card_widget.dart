import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';

enum BadgePosition {
  topRight(Alignment.topRight),
  topCenter(Alignment.topCenter);

  final Alignment alignment;

  const BadgePosition(this.alignment);
}

class PricingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;
  final BadgePosition badgePosition;

  const PricingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
    required this.isSelected,
    required this.onTap,
    this.badgePosition = BadgePosition.topRight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.redLight : AppColors.grayDark,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppColors.redLight : AppColors.white,
                    ),
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.redLight : AppColors.black,
                  ),
                  child: isSelected
                      ? Icon(Icons.check, color: Colors.white, size: 12.w)
                      : null,
                ),
                20.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Text(title, style: TextStyles.font16SemiBold)],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyles.font12Regular.copyWith(
                        color: AppColors.grayDark,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(price, style: TextStyles.font15Bold),
              ],
            ),
          ),
          if (badge != null)
            Positioned.fill(
              top: -11.h,
              right: 20.w,
              left: 20.w,
              child: Align(
                alignment: badgePosition.alignment,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.redLight,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    badge!,
                    style: TextStyles.font10Medium,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
