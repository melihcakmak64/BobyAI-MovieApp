import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';

class FeaturesTable extends StatelessWidget {
  final List<AppFeature> features;
  final SubscriptionPlan subscriptionPlan;

  const FeaturesTable({
    super.key,
    required this.features,
    required this.subscriptionPlan,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// FEATURE NAMES
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...features.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      e.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// FREE COLUMN
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                spacing: 16.h,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Free',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...features.map(
                    (e) => _FeatureIcon(isActive: e.isAvailableInFree),
                  ),
                ],
              ),
            ),
          ),

          ///  PRO COLUMN
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.redLight),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Column(
                spacing: 16.h,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Pro',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...features.map(
                    (e) => _FeatureIcon(
                      isActive: subscriptionPlan.featureIds.contains(e.id),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final bool isActive;

  const _FeatureIcon({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOutBack,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          final Offset beginOffset = isActive
              ? const Offset(0, -0.35)
              : const Offset(0, 0.35);

          return SlideTransition(
            position: Tween<Offset>(
              begin: beginOffset,
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          isActive ? Icons.check_circle : Icons.close,
          key: ValueKey(isActive),
          size: 20.r,
          color: isActive ? AppColors.green : AppColors.gray,
        ),
      ),
    );
  }
}
