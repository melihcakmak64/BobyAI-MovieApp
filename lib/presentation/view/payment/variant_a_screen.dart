import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/constants/image_paths.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/widgets/animations/pulse_animation_wrapper.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/presentation/view/payment/widgets/pricing_card_widget.dart';
import 'package:movie_app_task/presentation/view/payment/widgets/table_widget.dart';
import 'package:movie_app_task/presentation/viewmodel/paywall_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

class VariantA extends StatelessWidget {
  final PaywallViewModel viewModel = GetIt.I<PaywallViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 33.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            // Header
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  context.router.pushAndPopUntil(
                    const HomeRoute(),
                    predicate: (_) => false,
                  );
                },
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "MovieAI",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                16.verticalSpace,

                // Table Container
                Observer(
                  builder: (context) {
                    return FeaturesTable(
                      features: viewModel.allFeatures,
                      subscriptionPlan: viewModel.selectedPlan,
                    );
                  },
                ),

                SizedBox(height: 28.h),

                // Free Trial Toggle
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.redLight),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enable Free Trial",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Observer(
                        builder: (_) => SizedBox(
                          height: 31.h,
                          width: 51.w,
                          child: Switch(
                            value: viewModel.isFreeTrialEnabled,
                            onChanged: (val) => viewModel.toggleFreeTrial(val),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 37.h),

                Observer(
                  builder: (_) => Column(
                    spacing: 20.h,
                    children: viewModel.plans.map((plan) {
                      return PricingCard(
                        title: plan.title,
                        subtitle: plan.subtitle,
                        price: plan.price,
                        badge: plan.badge,
                        badgePosition: BadgePosition.topCenter,
                        isSelected: viewModel.selectedPlan?.id == plan.id,
                        onTap: () => viewModel.selectPlan(plan),
                      );
                    }).toList(),
                  ),
                ),

                20.verticalSpace,

                // Auto Renewable Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageHelper.asset(
                      AImage.protectIcon,
                      fit: BoxFit.contain,
                      width: 16.w,
                      height: 16.w,
                    ),
                    6.horizontalSpace,
                    Text(
                      "Auto Renewable, Cancel Anytime",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                Observer(
                  builder: (_) {
                    return PulseAnimation(
                      isActive: viewModel.isFreeTrialEnabled,
                      child: CustomButton(
                        text: viewModel.isFreeTrialEnabled
                            ? "3 Days Free\nNo Payment Now"
                            : "Unlock MovieAI PRO",
                        onPressed: () {
                          viewModel.purchaseSubscription();
                          context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                        },
                        trailingIcon: Icons.arrow_forward,
                      ),
                    );
                  },
                ),
                16.verticalSpace,

                // Footer Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFooterLink("Terms of Use"),
                    _buildFooterLink("Restore Purchase"),
                    _buildFooterLink("Privacy Policy"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String title, bool isFree, bool isPro) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 3.5.h),
      child: Row(
        children: [
          // Feature Name
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
          // FREE Column
          Expanded(
            flex: 1,
            child: Center(
              child: Icon(
                isFree ? Icons.check_circle : Icons.cancel,
                color: isFree ? AppColors.green : AppColors.gray,
                size: 24.w,
              ),
            ),
          ),
          // PRO Column
          Expanded(
            flex: 1,
            child: Center(
              child: Icon(
                isPro ? Icons.check_circle : Icons.cancel,
                color: isPro ? AppColors.green : AppColors.gray,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(text, style: TextStyle(fontSize: 8.sp)),
    );
  }
}
